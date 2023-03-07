import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackbar(String message) {
  Get.snackbar("Error", message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM);
}
