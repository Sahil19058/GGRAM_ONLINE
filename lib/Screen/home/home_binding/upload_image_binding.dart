import 'package:get/get.dart';

import '../home_controller/upload_image_controller.dart';

class UploadImageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(UploadImageController());
  }

}