import 'package:get/get.dart';
import '../add_issue_controller/report_road_controller.dart';


class ReportRoadBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ReportRoadController());
  }

}