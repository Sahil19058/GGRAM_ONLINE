import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final homePinController = TextEditingController();
  final originController = TextEditingController();
  final occupationController = TextEditingController();
  final householdController = TextEditingController();
  final incomeController = TextEditingController();

  final genderOptions = ['Male', 'Female', 'Other'];
  final statusOptions = ['Resident', 'Visitor'];
  RxString selectedGender = ''.obs;
  RxString selectedStatus = ''.obs;

  bool validateForm() => formKey.currentState?.validate() ?? false;

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) return 'Only letters allowed';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!RegExp(r'^[\\w-\\.]+@([\\w-]+\\.)+[\\w]{2,4}\$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) return 'Age is required';
    if (!RegExp(r'^[1-9][0-9]?$|^100$').hasMatch(value)) return 'Age must be 1-100';
    return null;
  }

  String? validatePin(String? value) {
    if (value == null || value.trim().isEmpty) return 'PIN is required';
    if (!RegExp(r'^\\d{6}\$').hasMatch(value)) return 'PIN must be 6 digits';
    return null;
  }

  String? validateGender(String? value) {
    if (value == null || value.trim().isEmpty) return 'Gender is required';
    return null;
  }

  String? validateStatus(String? value) {
    if (value == null || value.trim().isEmpty) return 'Residential status is required';
    return null;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    homePinController.dispose();
    originController.dispose();
    occupationController.dispose();
    householdController.dispose();
    incomeController.dispose();
  }
}
