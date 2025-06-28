import 'package:get/get.dart';

import '../auth_controller/introduction_controller.dart';

class IntroductionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(IntroductionController());
  }
  
}