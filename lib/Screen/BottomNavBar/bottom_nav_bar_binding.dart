import 'package:get/get.dart';

import '../home/home_controller/home_controller.dart';
import '../info/info_controller/info_page_controller.dart';
import 'bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController());
    Get.put(HomeController());
    Get.put(InfoPageController());
  }

}