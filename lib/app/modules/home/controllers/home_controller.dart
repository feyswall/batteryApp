import 'package:battery_plus/battery_plus.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  
  final Battery _battery = Battery();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final RxList<String> _messages = <String>[].obs;
  var batteryLevel = 0.obs;
  var _lastBatteryLevel = 0.obs;
  final int _batteryThreshold = 20;

  Future<void> addUser() async {
    FirebaseFirestore.instance.collection('users').add({
      'name': 'chambila',
      'email': 'chuchunge2co.tz',
    }).then((_) {
      print("data added successfully");
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getBatteryLevel();
    _monitorBattery();
  }

  Future<void> getMessageToken() async {
    _firebaseMessaging
        .getToken()
        .then((token) => {print('token is found: ${token}')});
  }

  Future<void> _getBatteryLevel() async {
    batteryLevel.value = await _battery.batteryLevel;
  }

  Future<void> _monitorBattery() async {
    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      final int batteryLev = await _battery.batteryLevel;
      batteryLevel.value = batteryLev;
      if (batteryLevel.value <= _batteryThreshold) {
        if (_lastBatteryLevel.value >= batteryLevel.value) {
          return;
        }
        print("send notification");
        _lastBatteryLevel.value = batteryLevel.value;
      }
    });
  }

  Future<void> sendingNotification() async {}
}
