import 'package:get/get.dart';

import 'bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController());
  }

}