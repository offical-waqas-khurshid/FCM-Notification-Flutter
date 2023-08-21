import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'message_screen.dart';

class NotificationService {
  FirebaseMessaging message = FirebaseMessaging.instance;

  /// Flutter Local Notification for show notification locally on app
  FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  /// init Local Notification for showing locally notification in app
  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    /// Initialized the default Icons of app for Android and IOS
    var androidInitialization =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInitialization = const DarwinInitializationSettings();

    /// Assigned to its functions
    var initializationSetting = InitializationSettings(
        android: androidInitialization, iOS: iosInitialization);

    await flutterLocalNotificationPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
  }

  /// Firebase init method for active app notification
  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
      print(message.data.toString());
      print(message.data["type"]);
      print(message.data["id"]);

      initLocalNotification(context, message);
      showNotification(message);
    });
  }

  /// Show notification on app method
  Future<void> showNotification(RemoteMessage message) async {
    // Future.delayed(Duration.zero, flutterLocalNotificationPlugin.show(id, title, body, notificationDetails))

    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(10000).toString(),
        "High Notification importance",
        importance: Importance.max);
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "This is channel for notification",
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  /// Request for Permission
  void requestNotificationPermission() async {
    NotificationSettings settings = await message.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission");
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user previous permission");
    } else {
      AppSettings.openAppSettings();
      print("user denied permission");
    }
  }

  /// Get Token Method
  Future<String> getToken() async {
    String? token = await message.getToken();
    return token!;
  }

  /// Token Expired checked
  void tokenRefresh() {
    message.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  /// Message Handling
  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data["type"] == "msj") {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MessageScreen(
            id: message.data['id'],
          );
        },
      ));
    }
  }

  /// Message attract with application check it is background or foreground

  Future<void> setUpAttractMessage(BuildContext context) async {

    /// when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage  != null){
      handleMessage(context, initialMessage);
    }

    /// when app is background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }
}
