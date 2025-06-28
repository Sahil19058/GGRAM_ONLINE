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

  bool validateSelection() => selectedCount <= 3;

  @override
  void onClose() {
    otherController.dispose();
    super.onClose();
  }
}
