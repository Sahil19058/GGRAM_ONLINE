import 'package:get/get.dart';

import '../add_issue_controller/your_reported_issue_controller.dart';

class YourReportedIssueBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(YourReportedIssueController());
  }

}