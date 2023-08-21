import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///if token expired then it used
    //notificationService.tokenRefresh();
    /// firebase init function call
    notificationService.firebaseInit(context);

    /// call setUpAttractMessaging for check background or foreground
    notificationService.setUpAttractMessage(context);

    /// Request permission method call
    notificationService.requestNotificationPermission();

    /// Get Token method call
    notificationService.getToken().then((value) {
      print("device token");
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          notificationService.getToken().then((value) async {
            var data = {
              'to': value.toString(), /// write here another app token key
              'priority': 'high',
              'notification':{
                'title': 'Waqas',
                 'body': 'Waqas Tech Limited',
              },
              'data': {
                'type': 'msj',
                'id': 'waqas1245',
              }
            };
            await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization':
                      'key=AAAAVBcpsd4:APA91bEHCu850wN_-Ylfv-qXZK5uIyV0j8LB39Q30Ujzyk8KTuHcNJkXfM3vG9TqCLOTgBhqIyXaA3eWjYNZ1ncq3rnqWeWPQgsX-Teum1Knp-ZJayZ2TYdcm_SAnz9-S0GN9fp1iiL5',
                });
          });
        },
        child: const Text("Send Notification"),
      )),
    );
  }
}
