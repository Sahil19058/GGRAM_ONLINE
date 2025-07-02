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
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     // App came to foreground
  //     print("App Resumed");
  //   } else if (state == AppLifecycleState.paused) {
  //     // App is in background
  //     print("App Paused");
  //   }
  // }
  // with WidgetsBindingObserver
}

