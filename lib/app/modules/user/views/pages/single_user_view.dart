import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:batteryi/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleUserView extends GetView<UserController> {
  const SingleUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
            title: 'helpme man',
            body: 'i want the power',
            token: 'eJwP29q3TvK1DsdO9-MFVP:APA91bFC76nwBO4r85LxVOk52NsgN1cBoP7sWwsWQulU-L-o5yj8e4GvW61yQQGBdwI_Bshc1Eqx4osHTyVIHeJKJAVsOez6cUreuwIEak5GQ-hbJiNSh6Gb6WzcV9V0YbtE7kBOML-i',
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
