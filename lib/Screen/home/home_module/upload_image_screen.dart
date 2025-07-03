import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import '../../../Routes/route_name.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../home_controller/upload_image_controller.dart';

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
        backgroundColor: Colors.transparent,
        appBar: const CommonAppBar(
          title: "Upload Image",
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildBody(controller),
              const SizedBox(height: 20),
              Obx(() => AbsorbPointer(
                    absorbing: controller.pickedImage.value == null,
                    child: Opacity(
                      opacity: 1.0,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.pickedImage.value != null) {
                            controller.clearImage();
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: AppColor.textSecondary),
                          ),
                          child: const Center(
                            child: Text(
                              "Retake Photo",
                              style: AppTextStyles.splashSubTitle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              InnerShadowButton(
                onPressed: () {
                  Get.toNamed(RouteName.reportRoadScreen);
                },
                text: "Submit",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(UploadImageController controller) {
    return Column(
      children: [
        Obx(
          () => Container(
            height: 500,
            decoration: BoxDecoration(
              color: AppColor.backgroundContainer,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0, 3),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
            ),
            child: controller.pickedImage.value == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => controller.pickFromCamera(),
                            child: Container(
                              height: 80,
                              width: 80,
                              padding: const EdgeInsets.all(20.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.buttonColor,
                              ),
                              child:
                                  SvgPicture.asset("assets/icons/camera.svg"),
                            ),
                          ),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: () => controller.pickFromGallery(),
                            child: Container(
                              height: 80,
                              padding: const EdgeInsets.all(20.0),
                              width: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.buttonColor,
                              ),
                              child:
                                  SvgPicture.asset("assets/icons/gallery.svg"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Upload Photo Using",
                        style: AppTextStyles.reportForm,
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      controller.pickedImage.value!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 500,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
