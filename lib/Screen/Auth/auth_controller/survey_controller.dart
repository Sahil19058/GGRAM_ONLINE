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

  List<RxBool> get selectedOptions => [
    brokenRoads,
    waterLogging,
    footpaths,
    dust,
    pollution,
    others,
  ];

  int get selectedCount => selectedOptions.where((e) => e.value).length;

  bool validateSelection() => selectedCount <= 3;

  @override
  void onClose() {
    otherController.dispose();
    super.onClose();
  }
}
