import 'package:get/get.dart';

import '../analytics_controller/analytics_heatmap_controller.dart';

class AnalyticsHeatmapBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HeatmapController());
  }

}