import 'package:get/get.dart';
import 'package:ggram_online/Screen/info/info_controller/official_detail_controller.dart';

class OfficialDetailBining extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OfficialDetailController());
  }

}