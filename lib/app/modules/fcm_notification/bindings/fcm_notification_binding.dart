import 'package:get/get.dart';

import '../controllers/fcm_notification_controller.dart';

class FcmNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FcmNotificationController>(
      () => FcmNotificationController(),
    );
  }
}
