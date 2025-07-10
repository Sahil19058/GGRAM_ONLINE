import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar({required String message, bool isError = true}) {
  Get.showSnackbar(
    GetSnackBar(
      message: message.tr,
      backgroundColor: isError ? Colors.black : Colors.green.shade700,
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color: isError ? Colors.red : Colors.white,
      ),
      isDismissible: true,
      duration: const Duration(milliseconds: 3000),
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackStyle: SnackStyle.FLOATING,
      barBlur: 30,
    ),
  );
}