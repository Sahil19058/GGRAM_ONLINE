import 'package:get/get.dart';

import '../auth_controller/otp_controller.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OtpController());
  }

}