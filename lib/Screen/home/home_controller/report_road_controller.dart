import 'dart:io';
import 'package:get/get.dart';

class ReportRoadController extends GetxController {
  Rx<File?> uploadedImage = Rx<File?>(null);

  // Example dropdown state
  RxString? selectedIssue = ''.obs;
  List<String> issueType = ['Pothole', 'Broken Light', 'Flooded Road'];

  void setImage(File file) {
    uploadedImage.value = file;
  }
}
