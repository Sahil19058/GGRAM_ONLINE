import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final homePin = TextEditingController();

  RxString? selectedGender = RxString('');

  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    age.dispose();
    homePin.dispose();
    super.onClose();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}