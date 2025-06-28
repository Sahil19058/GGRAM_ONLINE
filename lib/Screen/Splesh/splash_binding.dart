import 'package:get/get.dart';
import 'package:ggram_online/Screen/Splesh/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SplashController>(SplashController());
  }
}