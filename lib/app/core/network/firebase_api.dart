import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/data_response.dart';
import '../../models/user_model.dart';

abstract class FirebaseProvider {
  Future<ResponseData> login(
    Map<String, dynamic> data,
  );

  Future<ResponseData> register(
    Map<String, dynamic> data,
  );

  Future<ResponseData> verifyEmail(String code);

  Future<ResponseData> sendRegisterData(
    Map<String, dynamic> data,
  );

  Future<ResponseData> getRegisterData(String email);

  Future<ResponseData> resetPassword(
    Map<String, dynamic> data,
  );

  Future<ResponseData> confirmResetPassword(
    Map<String, dynamic> data,
  );

  Future<ResponseData> changePassword(
    Map<String, dynamic> data,
  );
}

class FirebaseProviderImpl extends FirebaseProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<ResponseData> changePassword(Map<String, dynamic> data) async {
    late ResponseData response;
    await _auth.currentUser
        ?.updatePassword(data['password'])
        .then((value) => response =
            ResponseData(responseCode: 200, errorCode: 200.toString()))
        .onError((FirebaseException error, stackTrace) =>
            ResponseData(responseCode: 400, errorCode: error.code));
    return response;
  }

  @override
  Future<ResponseData> login(Map<String, dynamic> data) async {
    late ResponseData response;

    await _auth
        .signInWithEmailAndPassword(
            email: data["email"], password: data["password"])
        .then((value) => response =
            ResponseData<UserCredential>(responseCode: 200, data: value))
        .onError((FirebaseException error, stackTrace) => response =
            ResponseData<UserCredential>(
                responseCode: 400, errorCode: error.code));
    return response;
  }

  @override
  Future<ResponseData> register(Map<String, dynamic> data) async {
    late ResponseData response;
    await _auth
        .createUserWithEmailAndPassword(
            email: data["email"], password: data["password"])
        .then((value) => response =
            ResponseData<UserCredential>(responseCode: 200, data: value))
        .onError((FirebaseException error, stackTrace) => response =
            ResponseData<UserCredential>(
                responseCode: 400, errorCode: error.code));
    return response;
  }

  @override
  Future<ResponseData> verifyEmail(String code) async {
    late ResponseData response;
    await _auth
        .applyActionCode(code)
        .then((value) => response =
            ResponseData(responseCode: 200, errorCode: 200.toString()))
        .onError((FirebaseException error, stackTrace) =>
            response = ResponseData(responseCode: 400, errorCode: error.code));
    return response;
  }

  @override
  Future<ResponseData> sendRegisterData(Map<String, dynamic> data) async {
    final docRef = _firestore.collection("userData").doc(data['email']);
    return await docRef
        .set(data)
        .then((value) => ResponseData(responseCode: 200))
        .onError((FirebaseException error, stackTrace) =>
            ResponseData(responseCode: 400, errorCode: error.code));
  }

  @override
  Future<ResponseData> getRegisterData(String email) async {
    final docRef = _firestore.collection("userData").doc(email);
    late ResponseData response;
    await docRef
        .get()
        .then(
          (value) => response = ResponseData<UserModel>(
            responseCode: 200,
            data: UserModel.fromJson(
              value.data(),
            ),
          ),
        )
        .onError(
          (FirebaseException error, stackTrace) =>
              response = ResponseData<UserModel>(
            responseCode: 400,
            errorCode: error.code,
            data: UserModel(),
          ),
        );
    return response;
  }

  @override
  Future<ResponseData> resetPassword(Map<String, dynamic> data) async {
    late ResponseData response;
    await _auth
        .sendPasswordResetEmail(
            email: data['email'],
            actionCodeSettings:
                ActionCodeSettings(url: "http://localhost:64805/"))
        .then((value) => response = ResponseData(
              responseCode: 200,
              errorCode: 200.toString(),
            ))
        .onError((FirebaseException error, stackTrace) {
      return response = ResponseData(responseCode: 400, errorCode: error.code);
    });
    return response;
  }

  @override
  Future<ResponseData> confirmResetPassword(Map<String, dynamic> data) async {
    late ResponseData response;
    await _auth
        .confirmPasswordReset(
          code: data['code'],
          newPassword: data['password'],
        )
        .then((value) => response = ResponseData(
              responseCode: 200,
              errorCode: 200.toString(),
            ))
        .onError((FirebaseException error, stackTrace) {
      return response = ResponseData(responseCode: 400, errorCode: error.code);
    });
    return response;
  }
}
