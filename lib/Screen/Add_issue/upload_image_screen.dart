import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import '../../../Theme/app_color.dart';
import '../../Routes/route_name.dart';
import 'add_issue_controller/upload_image_controller.dart';

class UploadImageScreen extends GetView<UploadImageController> {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.backgroundContainer,
        image: DecorationImage(
          image: AssetImage('assets/image/Splash.png'),
          opacity: 0.2,
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: Obx(() {

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // GALLERY BUTTON
                Expanded(
                  child: GestureDetector(
                    onTap: controller.isLocked.value ? null : () => controller.pickFromGallery(),
                    child: _buildIconButton("assets/icons/gallery.svg"),
                  ),
                ),

                // CAMERA BUTTON
                Expanded(
                  child: GestureDetector(
                    onTap: controller.isLocked.value
                        ? (){
                          print("pickedImage value: ${controller.pickedImage.value}");
                          Get.toNamed(RouteName.reportRoadScreen,arguments: controller.pickedImage.value);}
                        : () async => await controller.pickFromCamera(),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: AppColor.buttonColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.isLocked.value
                                  ? AppColor.buttonColor
                                  : AppColor.backgroundContainer,
                              boxShadow: [
                                controller.isLocked.value
                                    ? BoxShadow()
                                    : BoxShadow(
                                        offset: const Offset(0, -8.16),
                                        blurRadius: 10,
                                        spreadRadius: 0,
                                        color: Colors.grey.shade300,
                                        inset: true,
                                        blurStyle: BlurStyle.inner,
                                      ),
                              ],
                            ),
                            child: Center(
                              child: controller.isLocked.value
                                  ? SvgPicture.asset(
                                      "assets/icons/check-circle.svg")
                                  : null,
                            )),
                      ),
                    ),
                  ),
                ),

                // CLEAR/RESET BUTTON
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.clearImage(),
                    child: _buildIconButton("assets/icons/rotate-right.svg"),
                  ),
                ),
              ],
            ),
          );
        }),
        backgroundColor: Colors.transparent,
        appBar: const CommonAppBar(
          title: "Upload Image",
          centerTitle: true,
        ),
        body: _buildBody(controller),
      ),
    );
  }

  Widget _buildBody(UploadImageController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.backgroundContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Obx(() {
        if (controller.pickedImage.value != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.file(
              controller.pickedImage.value!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          );
        } else if (controller.isCameraInitialized.value &&
            controller.cameraController.value != null &&
            controller.cameraController.value!.value.isInitialized) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: CameraPreview(controller.cameraController.value!),
          );
        } else {
          return const Center(
            child: Text(
              "Initializing camera...",
              style: TextStyle(color: AppColor.textPrimary),
            ),
          );
        }
      }),
    );
  }

  Widget _buildIconButton(String iconPath) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: AppColor.backgroundContainer,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -8.16),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.grey.shade300,
            inset: true,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          color: AppColor.buttonColor,
        ),
      ),
    );
  }
}
