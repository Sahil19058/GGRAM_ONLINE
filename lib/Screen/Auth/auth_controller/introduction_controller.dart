import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IntroductionController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final homePin = TextEditingController();

  final argument = Get.arguments;

  RxString? selectedGender = RxString('');
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  final Rx<File?> pickedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

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
