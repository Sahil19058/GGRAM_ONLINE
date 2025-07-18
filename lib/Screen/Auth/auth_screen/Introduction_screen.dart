import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Screen/Auth/auth_controller/introduction_controller.dart';
import 'package:ggram_online/utils/form_validators.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_textfield.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class IntroductionScreen extends GetView<IntroductionController> {
  const IntroductionScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColor.backgroundContainer,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/image/Splash.png"),
            )
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: BoxDecoration(
                color: AppColor.backgroundContainer.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(40),
              ),
              margin: const EdgeInsets.only(
                  top: 40, bottom: 20, left: 16, right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Welcome ${controller.argument}",
                          style: AppTextStyles.authTitle,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.surveyScreen);
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: AppColor.buttonColor,
                              fontFamily: "Nunito Sans",
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.buttonColor,
                              decorationThickness: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Stack(
                        children: [
                          Obx(() {
                            return Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColor.outlineBorder,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  // fit: BoxFit.fill,
                                  image: controller.pickedImage.value != null
                                    ? FileImage(
                                            controller.pickedImage.value!)
                                        as ImageProvider
                                    : const AssetImage(
                                        'assets/image/user.png'
                                  ),
                                ),
                              ),
                            );
                          }),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.pickImageFromGallery();
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.buttonColor,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/image/camera.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Help us understand your civic issues better",
                      style: AppTextStyles.introText,
                    ),
                    const SizedBox(height: 25),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldView(
                            title: "Email ID",
                            controller: controller.email,
                            hintText: 'Please enter your email ID',
                            validator: FormValidators.validateEmail,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 10),
                          TextFieldView(
                            title: "Age",
                            controller: controller.age,
                            hintText: 'Please enter your age',
                            keyBoardType: TextInputType.number,
                            validator: FormValidators.validateAge,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              color: AppColor.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppColor.textFiledBackground,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: DropdownButtonFormField<String>(
                              value: controller.selectedGender?.value.isNotEmpty == true
                                ? controller.selectedGender?.value
                                : null,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle),
                                child: Image.asset("assets/icons/Vector.png"),
                              ),
                              hint: const Text("Select",
                                style: TextStyle(
                                  color: AppColor.textPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                                )
                              ),
                              validator: FormValidators.validateGender,
                              borderRadius: BorderRadius.circular(20),
                              dropdownColor: AppColor.backgroundContainer,
                              items: controller.genderOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                controller.selectedGender?.value = newValue!;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Occupation",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                              color: AppColor.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppColor.textFiledBackground,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: DropdownButtonFormField<String>(
                              value: controller.selectedGender?.value.isNotEmpty == true
                                  ? controller.selectedGender?.value
                                  : null,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                              icon: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle),
                                child: Image.asset("assets/icons/Vector.png"),
                              ),
                              hint: const Text("Select",
                                style: TextStyle(
                                  color: AppColor.textPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                                )
                              ),
                              validator: FormValidators.validateGender,
                              borderRadius: BorderRadius.circular(20),
                              dropdownColor: AppColor.backgroundContainer,
                              items: controller.genderOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                controller.selectedGender?.value = newValue!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InnerShadowButton(
                      text: "Submit",
                      onPressed: () {
                        // if (controller.validateForm()) {
                        Get.toNamed(AppRoutes.surveyScreen);
                        // } else {
                        //   Get.snackbar("Validation Error", "Please fill all fields correctly",
                        //     backgroundColor: Colors.redAccent.withOpacity(0.8),
                        //     colorText: Colors.white,
                        //   );
                        // }
                      },
                    ),
                    SizedBox(
                      height: isKeyboardVisible
                          ? MediaQuery.of(context).viewInsets.bottom
                          : 0,
                    ),
                  ]
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
