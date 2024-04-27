import 'package:animate_do/animate_do.dart';
import 'package:batteryi/app/modules/battery/controllers/battery_controller.dart';
import 'package:batteryi/app/modules/login/controllers/login_controller.dart';
import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerRequests extends GetView<UserController> {
  PowerRequests({Key? key}) : super(key: key);

  int selectedTool = 0;
  var batteryController = Get.put(BatteryController());
  var loginController = Get.put(LoginController());

  List<dynamic> tools = [
    {
      'image':
          'https://static-00.iconduck.com/assets.00/notification-icon-1842x2048-xr57og4y.png',
      'selected_image':
          'https://static-00.iconduck.com/assets.00/notification-icon-1842x2048-xr57og4y.png',
      'name': 'Sketch',
      'description': 'The digital design platform.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              FadeInDown(
                from: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInDown(
                from: 50,
                child: Text(
                  "People Request for power",
                  style:
                      TextStyle(color: Colors.blueGrey.shade400, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              NotificationCard(
                selectedTool: selectedTool,
                tools: tools,
              ),
            ],
          ),
        ));
  }
}

class NotificationCard extends StatelessWidget {
  BatteryController batteryController = Get.find();
  UserController userController = Get.find();
  final int selectedTool;
  final List tools;

  NotificationCard({
    super.key,
    required this.selectedTool,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount: batteryController.myNotifications.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: FadeInUp(
                delay: Duration(milliseconds: index * 100),
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.only(bottom: 20),
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: selectedTool == index
                              ? Colors.blue
                              : Colors.white.withOpacity(0),
                          width: 2),
                      boxShadow: [
                        selectedTool == index
                            ? BoxShadow(
                                color: Colors.blue.shade100,
                                offset: Offset(0, 3),
                                blurRadius: 10)
                            : BoxShadow(
                                color: Colors.grey.shade200,
                                offset: Offset(0, 3),
                                blurRadius: 10)
                      ]),
                  child: Row(
                    children: [
                      selectedTool == index
                          ? Image.network(
                              tools[0]['selected_image'],
                              width: 50,
                            )
                          : Image.network(
                              tools[0]['image'],
                              width: 50,
                            ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${batteryController.myNotifications[index].receiver_toc_id}',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'my descriptions',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        color:
                            selectedTool == index ? Colors.blue : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
