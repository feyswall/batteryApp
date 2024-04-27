import 'package:batteryi/app/modules/login/controllers/login_controller.dart';
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
    allUsers();
  }

  Future<void> registerUser(Map<String, dynamic> user) async {
    String? FCMToken = await _firebaseMessaging.getToken();
    user.addAll({"fcmToken": FCMToken});
    var outcome = db.collection("users").doc(FCMToken).set(user);
  }

  Future<UserModel?> userLogin(String email) async {
    UserModel? userModel = await getUser(email);
    if (userModel == null) {
      return null;
    }
    return userModel;
  }

  Future<UserModel?> find(String docId) async {
    await db.collection('users').doc(docId).get().then((DocumentSnapshot doc) {
      if (doc.data() == null) {
        return null;
      }
      var fUser = doc.data() as Map<String, dynamic>;
      return UserModel.fromJson(fUser);
    });
    return null;
  }

  Future<UserModel?> getUser(String email) async {
    var query =
        db.collection('users').where('email', isEqualTo: email).limit(1);
    UserModel? user = await query.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        return UserModel.fromJson(data);
      }
      return null;
    });
    return user;
  }

  Future<List<UserModel>> allUsers() async {
    var loginController = Get.put(LoginController());
    List<UserModel> list = [];
    var user = loginController.loggedUser.value;
    await db
        .collection('users')
        .where('fcmToken', isNotEqualTo: user.fcmToken)
        .get()
        .then((results) {
      for (var user in results.docs) {
        var data = user.data();
        UserModel userModel = UserModel.fromJson(data);
        list.add(userModel);
      }
      users.assignAll(list);
    });
    return list;
  }

  Future<List<UserModel>> selectUsers(var query) async {
    List<UserModel> list = [];
    await query.then((results) {
      for (var user in results.docs) {
        var data = user.data();
        UserModel userModel = UserModel.fromJson(data);
        list.add(userModel);
      }
    });
    return list;
  }
}
