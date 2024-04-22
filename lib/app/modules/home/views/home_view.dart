import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page View',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 52, 91),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("the text is executed");
          homeController.getMessageToken();
        },
        backgroundColor: Colors.blue[900],
        child: const Icon(
          Icons.send,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: RawMaterialButton(
          onPressed: () {
            homeController.addUser();
          },
          elevation: 2.0,
          fillColor: Colors.blue,
          shape: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Obx(() => Center(
                    child: Text(
                      "${homeController.batteryLevel.value}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
