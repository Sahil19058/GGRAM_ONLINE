import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../Routes/route_name.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../auth_controller/otp_controller.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

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
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.backgroundContainer.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "OTP Verification",
                    style: AppTextStyles.loginTitle,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Enter the OTP you received on your Phone.",
                    style: AppTextStyles.loginSubTitle,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "OTP",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: AppColor.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Pinput(
                      length: 6,
                      defaultPinTheme: PinTheme(
                        width: 54,
                        height: 48,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: AppColor.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.textFiledBackground,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColor.outlineBorder),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 54,
                        height: 48,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.textFiledBackground,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColor.outlineBorder),
                        ),
                      ),
                      showCursor: true,
                      onCompleted: (pin) {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Handle resend logic here
                        },
                        child: const Text(
                          "Resend OTP",
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
                  const SizedBox(height: 56,),
                  InnerShadowButton(
                    text: "Submit",
                    onPressed: () {
                      Get.toNamed(RouteName.introductionScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
