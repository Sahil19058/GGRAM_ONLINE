import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ggram_online/Routes/route_name.dart';

import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_textfield.dart';
import '../auth_controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          margin: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration: BoxDecoration(
            color: AppColor.backgroundContainer.withOpacity(0.8),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Log In",
                style: AppTextStyles.loginTitle,
              ),
              const SizedBox(height: 16),
              const Text(
                "Please enter your Phone number to continue.",
                style: AppTextStyles.loginSubTitle,
              ),
              const SizedBox(height: 32),
              TextFieldView(
                title: "Contact No.",
                controller: controller.phoneController,
                hintText: '000 000 000',
                keyBoardType: TextInputType.number,
              ),
              const Spacer(),
              InnerShadowButton(
                text: "LOGIN",
                onPressed: () {
                  Get.toNamed(RouteName.otpScreen);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: AppColor.textSecondary),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      height: 79,
                      width: 79,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.backgroundContainer),
                      child: Center(
                        child: Image.asset(
                          'assets/image/google.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      height: 79,
                      width: 79,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.backgroundContainer),
                      child: Center(
                        child: Image.asset(
                          'assets/image/apple.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
