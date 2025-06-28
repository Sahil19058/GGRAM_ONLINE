import 'package:get/get.dart';
import '../../Routes/route_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("done");
    Future.delayed(const Duration(seconds: 3), () {
      print("Navigating to login screen");
      Get.offNamed(RouteName.loginScreen);
    });
  }
}
