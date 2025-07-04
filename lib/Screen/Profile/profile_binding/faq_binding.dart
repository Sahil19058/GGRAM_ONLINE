import 'package:get/get.dart';
import 'package:ggram_online/Screen/profile/profile_controller/faq_controller.dart';

class FaqBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(FaqController());
  }

}