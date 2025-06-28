import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Widgets/comoon_appbar.dart';

import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/custom_popup.dart';
import 'home_controller/upload_image_controller.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadImageController controller = Get.put(UploadImageController());

    return Scaffold(
      backgroundColor: AppColor.backgroundContainer,
      appBar: CommonAppBar(
        title: "Upload Image",
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/Splash.png'),
            opacity: 0.2,
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
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
                      child: Center(
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
                  Get.back();
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
                    offset: Offset(0, 3),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.buttonColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset("assets/icons/camera.svg"),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => controller.pickFromGallery(),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.buttonColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset("assets/icons/gallery.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
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
