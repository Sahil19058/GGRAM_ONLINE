import 'package:get/get.dart';
import 'package:ggram_online/Screen/profile/profile_controller/profile_detail_controller.dart';

class ProfileDetailBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProfileDetailController());
  }

}