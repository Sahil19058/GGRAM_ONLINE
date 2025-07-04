import 'package:get/get.dart';
import '../add_issue_controller/issue_detail_controller.dart';


class IssueDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(IssueDetailController());
  }

}