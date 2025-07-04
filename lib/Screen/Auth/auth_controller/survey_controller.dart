import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyController extends GetxController {
  RxBool brokenRoads = false.obs;
  RxBool waterLogging = false.obs;
  RxBool footpaths = false.obs;
  RxBool dust = false.obs;
  RxBool pollution = false.obs;
  RxBool others = false.obs;

  final otherController = TextEditingController();

  RxInt satisfactionLevel = 0.obs;

  List<RxBool> get selectedOptions => [
    brokenRoads,
    waterLogging,
    footpaths,
    dust,
    pollution,
    others,
  ];

  int get selectedCount => selectedOptions.where((e) => e.value).length;

  // bool validateSelection() => selectedCount <= 3;

  void toggleOption(RxBool option) {
    if (option.value) {
      // Already selected, so allow unchecking
      option.value = false;
    } else if (selectedCount < 3) {
      // Less than 3 selected, allow checking
      option.value = true;
    } else {
      // Do nothing or show a warning
      Get.snackbar(
        "Limit Reached",
        "You can select up to 3 issues only.",
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
