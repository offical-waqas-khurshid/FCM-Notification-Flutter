import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fcm_notification_controller.dart';
import '../shared/home_page.dart';

class FcmNotificationView extends GetView<FcmNotificationController> {
  const FcmNotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FcmNotificationView'),
        centerTitle: true,
      ),
      body: const HomePage(),
    );
  }
}
