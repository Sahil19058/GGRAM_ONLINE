import 'package:get/get.dart';
import 'package:ggram_online/Screen/profile/profile_controller/contact_us_controller.dart';

class ContactUsBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ContactUsController());
  }

}