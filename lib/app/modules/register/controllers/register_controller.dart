import 'package:batteryi/app/modules/login/views/login_view.dart';
import 'package:batteryi/app/modules/user/controllers/user_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> submitForm() async {
    if (formKey!.currentState!.validate()) {
      final String name = nameController.text;
      final String phone = phoneController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String passwordConfirm = passwordConfirmController.text;
      // Do something with the form data, e.g., submit to a backend
      UserController().registerUser({
        'name': name,
        'phone': phone,
        'password': password,
        'email': email,
      });
      Get.to(LoginView());
    }
  }
}
