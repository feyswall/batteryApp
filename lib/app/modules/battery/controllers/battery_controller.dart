import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:batteryi/app/modules/battery/model/NotifyModel.dart';
import 'package:batteryi/app/modules/login/controllers/login_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BatteryController extends GetxController {
  //TODO: Implement BatteryController
  FirebaseFirestore db = FirebaseFirestore.instance;
  var loginController = Get.put(LoginController());

  var myNotifications = <NotifyModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    selectNotifications();
  }

  Future<void> createNotification(Map<String, dynamic> data) async {
    await db.collection('notifications').add({
      'sender_toc_id': data['sender_doc_id'],
      'receiver_toc_id': data["receiver_doc_id"],
      'type': data['type'] ?? 'battery',
      'status': 'true',
    });
  }

  Future<void> deleteNotification() async {}

  Future<void> singleNotification(String doc_id) async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<List<NotifyModel>> selectNotifications() async {
    List<NotifyModel> nota = [];
    await db
        .collection('notifications')
        .where('receiver_toc_id', isEqualTo: loginController.loggedUser.value.fcmToken)
        .get()
        .then((snapshots) {
      for (var notification in snapshots.docs) {
        var data = notification.data();
        var notifyModel = NotifyModel.fromJson(data);
        nota.add(notifyModel);
      }
    });
    myNotifications.value = nota;
    return nota;
  }

  void increment() => count.value++;
}
