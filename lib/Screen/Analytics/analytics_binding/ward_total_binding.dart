import 'package:get/get.dart';

import '../analytics_controller/ward_total_issue_controller.dart';

class WardTotalIssueBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(WardTotalIssueController());
  }

}