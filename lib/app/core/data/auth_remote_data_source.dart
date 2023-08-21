//
// import '../../models/data_response.dart';
//
// abstract class AuthRemoteDataSource {
//   Future<ResponseData> login(Map<String, dynamic> data);
//
//   Future<ResponseData> register(
//     Map<String, dynamic> data,
//   );
//
//   Future<ResponseData> verifyEmail(String code);
//
//   Future<ResponseData> sendRegisterData(
//     Map<String, dynamic> data,
//   );
//
//   Future<ResponseData> getRegisterData(String email);
//
//   Future<ResponseData> resetPassword(
//     Map<String, dynamic> data,
//   );
//
//   Future<ResponseData> confirmResetPassword(
//     Map<String, dynamic> data,
//   );
//
//   Future<ResponseData> changePassword(
//     Map<String, dynamic> data,
//   );
// }
//
// class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
//   FirebaseProvider firebaseProvider;
//
//   AuthRemoteDataSourceImpl(this.firebaseProvider);
//
//   @override
//   Future<ResponseData> login(Map<String, dynamic> data) {
//     return firebaseProvider.login(
//       data,
//     );
//   }
//
//   @override
//   Future<ResponseData> changePassword(Map<String, dynamic> data) {
//     return firebaseProvider.changePassword(data);
//   }
//
//   @override
//   Future<ResponseData> confirmResetPassword(Map<String, dynamic> data) {
//     return firebaseProvider.confirmResetPassword(data);
//   }
//
//   @override
//   Future<ResponseData> getRegisterData(String email) {
//     return firebaseProvider.getRegisterData(
//       email,
//     );
//   }
//
//   @override
//   Future<ResponseData> register(Map<String, dynamic> data) {
//     return firebaseProvider.register(
//       data,
//     );
//   }
//
//   @override
//   Future<ResponseData> resetPassword(Map<String, dynamic> data) {
//     return firebaseProvider.resetPassword(data);
//   }
//
//   @override
//   Future<ResponseData> sendRegisterData(Map<String, dynamic> data) async {
//     return await firebaseProvider.sendRegisterData(
//       data,
//     );
//   }
//
//   @override
//   Future<ResponseData> verifyEmail(String code) {
//     return firebaseProvider.verifyEmail(code);
//   }
// }
