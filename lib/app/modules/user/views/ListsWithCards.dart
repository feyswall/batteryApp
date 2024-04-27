import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:batteryi/app/modules/user/views/CardList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListsWithCards extends GetView<UserController> {
  ListsWithCards({super.key});
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return userController.users.isEmpty
          ? const Text("Loading...")
          : ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                return CardList(user: userController.users[index]);
              },
            );
    });
  }
}
