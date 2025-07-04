import 'dart:io';
import 'package:get/get.dart';

class ReportRoadController extends GetxController {
  Rx<File?> uploadedImage = Rx<File?>(null);
  RxString? selectedIssue = ''.obs;
  List<String> issueType = ['Pothole', 'Broken Light', 'Flooded Road'];

  @override
  void onInit() {
    super.onInit();
    // Initialize uploadedImage with the passed argument
    final File? imageFile = Get.arguments as File?;
    if (imageFile != null) {
      uploadedImage.value = imageFile;
      print("Image received in ReportRoadController: ${imageFile.path}");
    } else {
      print("No image received in ReportRoadController");
    }
  }

  void setImage(File file) {
    uploadedImage.value = file;
    print("Image set in ReportRoadController: ${file.path}");
  }
}