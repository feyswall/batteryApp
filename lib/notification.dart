// import 'dart:html';
// import 'dart:io';
// import 'dart:math';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class NotificationSetup {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initializeNitofication() async {
//     AwesomeNotifications().initialize('resourse://drawable/res_launcher_icon', [
//       NotificationChannel(
//         channelKey: 'high_importance_channel',
//         channelName: 'chat notification',
//         importance: NotificationImportance.Max,
//         vibrationPattern: highVibrationPattern,
//         channelShowBadge: true,
//         channelDescription: "chat notifications",
//       ),
//     ]);
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//   }

//   void configurePushNotifications(BuildContext context) async {
//     initializeNotofication();

//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print("================");
//       print("=============${message.notification!.body}");
//       print("===============");
//       if (message.notification != null) {
//         createOrderNotifications(
//           title: message.notification!.title,
//           body: message.notification!.body,
//         );
//       }
//     });
//   }

//   Future<void> createOrderNotifications({String?  title, String? body}) async {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//           id: 0,
//           channelKey: 'high_importance_channel',
//           title: title,
//           body: body,
//           ),
//     );
//   } 

//   void eventListenerCallback(BuildContext context) {
//     AwesomeNotifications().setListeners(
//       onActionReceivedMethod: NotificationController.onActionReceivedMethod,
//     );
//   }
// }

// @pragma('vm:entry-point')
// Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

// class NotificationController {
//   @pragma('vm:entry-point')
//   static Future<void> onActionReceivedMethod(
//       ReceivedNotification receivedNotification) async {}
// }
