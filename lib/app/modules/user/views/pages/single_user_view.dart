import 'package:animate_do/animate_do.dart';
import 'package:batteryi/app/modules/login/controllers/login_controller.dart';
import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:batteryi/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class SingleUserView extends GetView<UserController> {
  SingleUserView({Key? key}) : super(key: key);
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context);
    LoginController loginController = Get.find();
    var user = loginController.loggedUser();
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg',
                  fit: BoxFit.cover,
                  width: 280,
                ),
                SizedBox(
                  height: 0,
                ),
                FadeInDown(
                  child: Column(
                    children: [
                      Text(
                        '${args?['user'].name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.grey.shade900),
                      ),
                    ],
                  ),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20),
                    child: Text(
                      'would you like to send a power donate request to this person.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 400),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black.withOpacity(0.13)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffeeeeee),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Stack(
                      children: [],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                FadeInDown(
                  delay: const Duration(milliseconds: 600),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () async {
                      _dialog.show(
                          message: 'Loading...',
                          type: SimpleFontelicoProgressDialogType.normal);
                      await FirebaseApi().callOnFcmApiSendPushNotifications(
                        title: 'Power Donation Request',
                        body:
                            'Open the notification to open the request and view the request',
                        token: args?['fcmToken'] ?? 'Nullin',
                      );
                      _dialog.hide();
                      await Alert(
                        context: context,
                        title: "Request Sent",
                        desc: "please wait for response from the donor.",
                      ).show();
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: _isLoading
                        ? Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Send Request",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
