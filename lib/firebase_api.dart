import 'dart:convert';
import 'package:batteryi/app/modules/battery/controllers/battery_controller.dart';
import 'package:batteryi/app/modules/battery/views/powerRequests.dart';
import 'package:batteryi/app/modules/home/controllers/home_controller.dart';
import 'package:batteryi/app/modules/login/controllers/login_controller.dart';
import 'package:batteryi/app/modules/user/model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  // print('title: ${message.notification!.title}');
  // print('body: ${message.notification!.body}');
  // print('paylaod: ${message.data}');
  print('xxxxxxxxxxx background xxxxxxxxxxx');
}

class FirebaseApi extends GetxController {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final db = FirebaseFirestore.instance;
  HomeController homeController = Get.put(HomeController());
  LoginController loginController = Get.put(LoginController());

  final _androidChannel = const AndroidNotificationChannel(
    'hight_importance_channel',
    'High Importance Notification',
    description: 'This channel is used for important notification alone',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    Get.to(() => PowerRequests(), arguments: message);
  }

  Future initialLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/food');
    const settings = InitializationSettings(android: android);
    await _localNotifications.initialize(
      settings,
      onSelectNotification: (payload) {
        final message = RemoteMessage.fromMap(jsonDecode(payload!));
        handleBackgroundMessage(message);
        handleMessage(message);
      },
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
  }

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((Message) {
      final notification = Message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/food',
            ),
          ),
          payload: jsonEncode(Message.toMap()));
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    initPushNotification();
    initialLocalNotifications();
  }

  Future<bool> callOnFcmApiSendPushNotifications(
      {required String title, required String body, String? token}) async {
    await db.collection('users').doc(token).get().then((snapshots) {
      var desiredUser =
          UserModel.fromJson(snapshots.data() as Map<String, dynamic>);
      loginController.notifyFrom.value = desiredUser;
      print('${loginController.notifyFrom.value} is our destination');
    });
    const postUrl = "https://fcm.googleapis.com/fcm/send";
    final data = {
      "to": token,
      "notification": {
        "title": title,
        "body": body,
      },
      "data": {
        "type": "Order",
        "id": "28",
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "user": loginController.notifyFrom.value,
      }
    };

    final headers = {
      "content-type": 'application/json',
      "Authorization":
          'key=AAAA0o62HNE:APA91bGBMsQ0rmTgMqZX0pi1U0d1eQ2BY0a0iel9FJS9Xfs5MB_IPds6sd25fLgmZsLeQ2gjNUxgUM317tEBHWcNoUwxyL1yfi0MOhLazEFf0P60GrMvb-mJxcEdHt1YCmUsps-fEN9E'
    };

    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      BatteryController batteryController = BatteryController();
      var notf = {
        'sender_doc_id': loginController.loggedUser.value.fcmToken,
        'receiver_doc_id': token,
        'type': 'battery'
      };
      await batteryController.createNotification(notf);
      print(
          'ssssssssssssssssssssss sssssssssssssssssssssss sssssssssssssssssssssssss');
      print(notf);
      return true;
    } else {
      print('FCM ERROR');
      return false;
    }
  }
}
