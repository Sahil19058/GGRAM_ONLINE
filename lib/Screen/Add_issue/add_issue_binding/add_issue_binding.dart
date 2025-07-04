import 'package:get/get.dart';
import '../add_issue_controller/add_issue_controller.dart';


class AddIssueBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AddIssueController());
  }

}