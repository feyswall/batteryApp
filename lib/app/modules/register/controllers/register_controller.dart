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

  void submitForm() {
    if (formKey!.currentState!.validate()) {
      final String name = nameController.text;
      final String phone = phoneController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String passwordConfirm = passwordConfirmController.text;

      // Do something with the form data, e.g., submit to a backend
      print('Name: $name');
      print('Email: $email');
      print('phone: $phone');
      print('password: $password');
      print('confirm password: $passwordConfirm');
    }
  }
}
