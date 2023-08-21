// import '../../models/data_response.dart';
// import '../../models/user_model.dart';
// import '../data/auth_remote_data_source.dart';
//
// abstract class AuthRepository {
//   Future<ResponseData> register(UserModel user);
//
//   Future<ResponseData> verifyEmail(String code);
//
//   Future<ResponseData> sendRegisterData(UserModel userModel);
//
//   Future<ResponseData> login(UserModel user);
//
//   Future<ResponseData> resetPassword(String email);
//
//   Future<ResponseData> confirmResetPassword(Map<String, dynamic> data);
//
//   Future<ResponseData> changePassword(Map<String, dynamic> request);
//
//   //UserModel? getLoggedInUserData();
//
//   Future<void> logout();
//
//   Future<ResponseData> getRegisterData(String email, bool isLocal);
// }
//
// class AuthRepositoryImpl extends AuthRepository {
//   AuthRemoteDataSource authRemoteDataSource;
//
//   //AuthLocalDataSource authLocalDataSource;
//
//   // AuthRepositoryImpl(
//   //     {required this.authRemoteDataSource, required this.authLocalDataSource});
//
//   AuthRepositoryImpl({required this.authRemoteDataSource});
//
//   @override
//   Future<ResponseData> changePassword(Map<String, dynamic> request) async {
//     return await authRemoteDataSource.changePassword(request);
//   }
//
//   @override
//   Future<ResponseData> confirmResetPassword(Map<String, dynamic> data) async {
//     return await authRemoteDataSource.confirmResetPassword(data);
//   }
//
//   // @override
//   // UserModel? getLoggedInUserData() {
//   //   final data = authLocalDataSource.getSessionData();
//   //   if (data == null) return null;
//   //   return UserModel.fromJson(jsonDecode(data));
//   // }
//
//   @override
//   Future<ResponseData> getRegisterData(String email, bool isLocal) async {
//     if (isLocal) {
//       UserModel? userModel = authLocalDataSource.getUserSession();
//       return Future.value(ResponseData(responseCode: 200, data: userModel));
//     } else {
//       return await authRemoteDataSource.getRegisterData(email).then(
//           (value) async =>
//               await authLocalDataSource.storeUserSession(value.data));
//     }
//   }
//
//   @override
//   Future<ResponseData> login(UserModel user) async {
//     final param = {
//       "email": user.email,
//       "password": user.password,
//     };
//     return await authRemoteDataSource.login(param);
//   }
//
//   @override
//   Future<void> logout() async {
//     authLocalDataSource;
//   }
//
//   @override
//   Future<ResponseData> register(UserModel user) async {
//     final param = {
//       "email": user.email,
//       "password": user.password,
//     };
//     return await authRemoteDataSource.register(param);
//   }
//
//   @override
//   Future<ResponseData> resetPassword(String email) async {
//     final request = {
//       "email": email,
//     };
//     return await authRemoteDataSource.resetPassword(request);
//   }
//
//   @override
//   Future<ResponseData> sendRegisterData(UserModel userModel) async {
//     await authLocalDataSource.storeUserSession(userModel);
//     return await authRemoteDataSource.sendRegisterData(userModel.toJson());
//   }
//
//   @override
//   Future<ResponseData> verifyEmail(String code) async {
//     return await authRemoteDataSource.verifyEmail(code);
//   }
// }
