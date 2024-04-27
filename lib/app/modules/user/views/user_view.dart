import 'package:batteryi/app/modules/user/views/ListsWithCards.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  UserView({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    userController.allUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscribers List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 4, 52, 91),
      ),
      body: Center(
        child: ListsWithCards(),
      ),
    );
  }
}
