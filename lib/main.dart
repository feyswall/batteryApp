import 'package:batteryi/app/modules/home/controllers/home_controller.dart';
import 'package:batteryi/app/modules/register/views/register_view.dart';
import 'package:batteryi/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:batteryi/app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print(
      "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: ${message.messageId}");
  final HomeController homeController = HomeController();
  homeController.batteryLevel.value = 2289;
  print(homeController.batteryLevel.value);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  FirebaseApi().initNotifications();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tazan",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
              color:
                  Colors.white), // Change the color of the back arrow to white
        ),
      ),
    ),
  );
}
