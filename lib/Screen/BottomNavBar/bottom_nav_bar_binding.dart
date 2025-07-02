import 'package:get/get.dart';

import '../Analytics/analytics_controller/aile_gurugram_controller.dart';
import '../Analytics/analytics_controller/analytics_heatmap_controller.dart';
import '../Analytics/analytics_controller/ward_doing_controller.dart';
import '../home/home_controller/home_controller.dart';
import '../home/home_controller/report_road_controller.dart';
import '../info/info_controller/info_page_controller.dart';
import 'bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController());
    Get.put(HomeController());
    Get.put(HeatmapController());
    Get.put(InfoPageController());
    Get.put(WardDoingController());
    Get.put(AlieGuruGramController());
    Get.put(ReportRoadController());
  }

}