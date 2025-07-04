import 'package:get/get.dart';

import '../info_controller/info_page_controller.dart';

class InfoPageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(InfoPageController());
  }

}