import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:batteryi/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleUserView extends GetView<UserController> {
  const SingleUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args['user'].name);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Single Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseApi().callOnFcmApiSendPushNotifications(
            title: '${args['user'].name} Power Request',
            body: 'Open the notification to open the request and view the request',
            token: args['fcmToken'],
          );
        },
        backgroundColor: const Color.fromARGB(255, 6, 65, 113),
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
    );
  }
}
