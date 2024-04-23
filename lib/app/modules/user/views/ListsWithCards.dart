import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:batteryi/app/modules/user/model/UserModel.dart';
import 'package:batteryi/app/modules/user/views/CardList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListsWithCards extends GetView<UserController> {
  const ListsWithCards({super.key});

  @override
  Widget build(BuildContext context) {
    UserController userController = UserController();
    // Sample data for three lists
    RxList<UserModel> listsData = userController.users;
    print(listsData);
    return Obx(() {
      return listsData.isNotEmpty
          ? const Text("List Is Empty")
          : ListView.builder(
              itemCount: listsData.length,
              itemBuilder: (context, index) {
                return CardList(user: listsData[index]);
              },
            );
    });
  }
}
