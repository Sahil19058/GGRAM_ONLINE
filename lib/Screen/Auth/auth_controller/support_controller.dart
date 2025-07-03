import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  RxBool frontendBackEndDesign = false.obs;
  RxBool research = false.obs;
  RxBool onGroundVolunteering = false.obs;
  RxBool marketing = false.obs;
  RxBool contentCreation = false.obs;
  RxBool fundraisingSponsorship = false.obs;
  RxBool others = false.obs;

  final otherController = TextEditingController();

  List<RxBool> get selectedOptions => [
    frontendBackEndDesign,
    research,
    onGroundVolunteering,
    marketing,
    contentCreation,
    fundraisingSponsorship,
    others,
  ];

  int get selectedCount => selectedOptions.where((e) => e.value).length;

  // bool validateSelection() => selectedCount <= 3;

  void toggleOption(RxBool option) {
    if (option.value) {
      // Allow unchecking
      option.value = false;
    } else if (selectedCount < 3) {
      // Allow checking if less than 3 selected
      option.value = true;
    } else {
      // Show error if more than 3
      Get.snackbar(
        "Limit Reached",
        "You can select up to 3 options only.",
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    otherController.dispose();
    super.onClose();
  }
}
