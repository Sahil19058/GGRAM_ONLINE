import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ggram_online/Screen/Add_issue/add_issue_controller/report_road_controller.dart';

class UploadImageController extends GetxController {
  final Rx<File?> pickedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  final ReportRoadController reportController = Get.find();
  Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  RxBool isCameraInitialized = false.obs;


  final AudioPlayer audioPlayer = AudioPlayer();

  /// 👉 Disable camera & gallery after image pick
  final RxBool isImagePicked = false.obs;
  late final RxBool isLocked = isImagePicked;

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        cameraController.value = CameraController(
          cameras[0],
          ResolutionPreset.high,
          enableAudio: false,
        );
        await cameraController.value!.initialize();
        await cameraController.value!.setFlashMode(FlashMode.off);
        isCameraInitialized.value = true;
      }
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  Future<void> pickFromCamera() async {
    if (isImagePicked.value) return; // prevent new capture if already picked

    if (cameraController.value != null &&
        cameraController.value!.value.isInitialized) {
      try {
        final XFile picture = await cameraController.value!.takePicture();
        await audioPlayer.play(AssetSource('sounds/capture.mp3'));
        pickedImage.value = File(picture.path);
        reportController.setImage(File(picture.path));
        isImagePicked.value = true; // 🔒 lock buttons
      } catch (e) {
        print("Error taking picture: $e");
      }
    }
  }

  Future<void> pickFromGallery() async {
    if (isImagePicked.value) return; // prevent gallery if already picked

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
      reportController.setImage(File(image.path));
      isImagePicked.value = true; // 🔒 lock buttons
    }
  }

  void clearImage() {
    pickedImage.value = null;
    isImagePicked.value = false; // 🔓 unlock buttons
    reportController.setImage(File(""));
  }

  @override
  void onClose() {
    cameraController.value?.dispose();
    super.onClose();
  }
}
