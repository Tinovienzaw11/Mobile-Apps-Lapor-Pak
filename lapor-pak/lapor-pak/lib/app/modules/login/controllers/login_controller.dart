import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var hidePass = true.obs;
  var isLoading = false.obs;

  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailC.dispose();
    passC.dispose();
  }
}
