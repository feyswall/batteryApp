import 'package:batteryi/app/modules/home/views/home_view.dart';
import 'package:batteryi/app/modules/register/views/register_view.dart';
import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:batteryi/app/modules/user/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
}

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxList<String> _messages = <String>[].obs;
  bool isAccepted = false;
  final UserController userController = UserController();
  RxString varError = ''.obs;
  Rx<UserModel> loggedUser = UserModel().obs;
  Rx<UserModel> notifyFrom = UserModel().obs;

  final formKey = GlobalKey<FormState>();

  Future<void> notificationPermission() async {}

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // If the application is on the foreground view
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // _messages.add("onMessage: ${message.notification?.body}");
      print("The right path to success");
    });

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  void _handleMessage(RemoteMessage message) {
    Get.to(RegisterView());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setupInteractedMessage();
  }

  Future<Map<String, dynamic>?> submitLoginForm() async {
    if (formKey.currentState!.validate()) {
      final String email = emailController.text;
      final String password = passwordController.text;
      print('For email: $email , for password $password');
      UserModel? user = await userController.userLogin(email);
      if (user == null) {
        return {
          'status': 'fail',
          'type': 'email',
          'messsage': 'user not found'
        };
      }
      if (user.password != password) {
        return {
          'status': 'fail',
          'type': 'password',
          'messsage': 'password error'
        };
      }
      return {
        'status': 'success',
        'messsage': 'login successfully',
        'user': user
      };
    }
    return null;
  }
}
