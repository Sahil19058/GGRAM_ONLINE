import 'package:get/get.dart';

import '../auth_controller/support_controller.dart';

class SupportBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SupportController());
  }

}