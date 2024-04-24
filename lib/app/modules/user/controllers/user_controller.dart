import 'package:batteryi/app/modules/user/model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final db = FirebaseFirestore.instance;

  RxList<UserModel> users = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    selectUsers();
  }

  Future<void> registerUser(Map<String, dynamic> user) async {
    String? FCMToken = await _firebaseMessaging.getToken();
    user.addAll({"fcmToken": FCMToken});
    var outcome = db.collection("users").doc(FCMToken).set(user);
  }

  Future<void> selectUsers() async {
    List<UserModel> list = [];
    await db.collection('users').get().then((results) {
      for (var user in results.docs) {
        UserModel userModel = UserModel(
          name: user.get('name'),
          email: user.get('email'),
          phone: user.get('phone'),
          password: user.get('password'),
          fcmToken: user.get('fcmToken'),
        );
        list.add(userModel);
      }
      users.assignAll(list);
    });
  }
}
