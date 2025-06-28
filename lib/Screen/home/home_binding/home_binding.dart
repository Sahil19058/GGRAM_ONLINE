import 'package:get/get.dart';
import 'package:ggram_online/Screen/home/home_controller/home_controller.dart';


class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeController());
  }

}