import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  Rx<File?> profileImage = Rx<File?>(null);

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);

    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    }
  }

  bool validateForm() => formKey.currentState?.validate() ?? false;

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
