import 'package:get/get.dart';

import '../modules/fcm_notification/bindings/fcm_notification_binding.dart';
import '../modules/fcm_notification/views/fcm_notification_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FCM_NOTIFICATION;

  static final routes = [
    GetPage(
      name: _Paths.FCM_NOTIFICATION,
      page: () => const FcmNotificationView(),
      binding: FcmNotificationBinding(),
    ),
  ];
}
