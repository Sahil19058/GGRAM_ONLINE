import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../../Routes/route_name.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_textfield.dart';
import '../../../utils/form_validators.dart';
import '../auth_controller/tell_about_controller.dart';

class TellAboutScreen extends GetView<TellAboutController> {
  const TellAboutScreen({super.key});

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
              )),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.backgroundContainer.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(40),
              ),
              margin: const EdgeInsets.only(
                top: 40, bottom: 20, left: 16, right: 16
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 183,
                      width: 113,
                      child: Image.asset(
                          "assets/image/profile_detail_screen_img.png"
                      )
                    ),
                    const Text(
                      "Tell us about yourself",
                      style: AppTextStyles.authTitle,
                    ),
                    const SizedBox(height: 16),
                    Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldView(
                            title: "Name",
                            controller: controller.name,
                            hintText: 'Please enter your name',
                            validator: FormValidators.validateName,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 10),
                          TextFieldView(
                            title: "Home PIN",
                            controller: controller.homePin,
                            hintText: 'Please enter your Home PIN',
                            keyBoardType: TextInputType.number,
                            validator: FormValidators.validatePin,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              "Help us understand civic Issues in your locality.",
                              style: AppTextStyles.tellAboutYourSelf,
                            ),
                          )
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
                        Get.toNamed(AppRoutes.introductionScreen,
                            arguments: controller.name.text);
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
