import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'report_road_controller.dart'; // <-- Add this import

class UploadImageController extends GetxController {
  final Rx<File?> pickedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  final ReportRoadController reportController = Get.find(); // Shared controller

  Future<void> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImage.value = File(image.path);
      reportController.setImage(File(image.path)); // Store in shared controller
    }
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
      reportController.setImage(File(image.path)); // Store in shared controller
    }
  }

  void clearImage() {
    pickedImage.value = null;
    reportController.setImage(File("")); // Reset image if needed
  }
}
