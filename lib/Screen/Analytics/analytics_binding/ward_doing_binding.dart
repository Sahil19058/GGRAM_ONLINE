import 'package:get/get.dart';

import '../analytics_controller/ward_doing_controller.dart';

class WardDoingBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(WardDoingController());
  }

}