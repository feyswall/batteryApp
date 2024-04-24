import 'package:batteryi/app/modules/user/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 4, 52, 91),
            ),
            child: Text(
              'Battery Boot App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Subscribers',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Get.to(UserView());
            },
          ),
        ],
      ),
    );
  }
}
