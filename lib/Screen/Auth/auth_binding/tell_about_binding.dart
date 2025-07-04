import 'package:get/get.dart';

import '../auth_controller/tell_about_controller.dart';

class TellAboutBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(TellAboutController());
  }

}