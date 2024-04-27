import 'package:batteryi/app/modules/login/controllers/login_controller.dart';
import 'package:batteryi/app/modules/login/views/login_view.dart';
import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:batteryi/app/modules/user/model/UserModel.dart';
import 'package:batteryi/app/modules/user/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppDrawer extends GetView<LoginController> {
  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 4, 52, 91),
            ),
            child: Column(
              children: [
                Text(
                  'Battery Boot App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  '${loginController.loggedUser.value.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Subscribers',
              style: TextStyle(color: Colors.black),
            ),
            leading: Icon(
              Iconsax.people,
              color: Colors.black,
              size: 18,
            ),
            onTap: () {
              Get.to(() => UserView());
            },
          ),
          ListTile(
            title: TextButton(
              child: Text(
                "logout",
                style: TextStyle(color: Color.fromARGB(255, 7, 148, 248)),
              ),
              onPressed: () {
                loginController.loggedUser.value = UserModel();
                Get.to(LoginView());
              },
            ),
          ),
        ],
      ),
    );
  }
}
