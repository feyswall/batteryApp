import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/battery_controller.dart';

class BatteryView extends GetView<BatteryController> {
  const BatteryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BatteryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BatteryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
