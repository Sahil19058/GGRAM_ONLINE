
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeatmapController extends GetxController {
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  void changePage(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}