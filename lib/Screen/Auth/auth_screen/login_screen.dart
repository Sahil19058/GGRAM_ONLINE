import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
          body: _buildBody(context,isKeyboardVisible)
        ),
      );
    });
  }
  Widget _buildBody(context,isKeyboardVisible) {
    return Container(
      // height: double.infinity,
      margin: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: AppColor.backgroundContainer.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(40),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 183,
                width: 113,
                child: Image.asset("assets/image/login_screen_img.png")),
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
              maxLength: 10,
              counterText: '',
              hintText: '000 000 0000',
              title: "Contact No.",
              keyBoardType: TextInputType.number,
              // validator: (value) => AppValidations.validateContact(value),
              prefixIcon: Obx(
                  () => InkWell(
                onTap: () => controller.openCountryCodePicker(context),
                child: Container(
                  height: 30,
                  width: 90,
                  color: Colors.transparent,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "+${controller.selectedCountryCode.value?.phoneCode ?? 91}",
                            style: AppTextStyles.selectHintText,
                            // fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset(
                              "assets/icons/country_picker_arrow.svg")
                        ],
                      ),
                    ),
                  ),
                ),
                ),
              ),
              controller: controller.phoneController,
            ),
            const SizedBox(
              height: 48,
            ),
            InnerShadowButton(
              text: "LOGIN",
              onPressed: () {
                Get.toNamed(AppRoutes.otpScreen);
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
                  color: AppColor.textSecondary
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    controller.loginWithGoogle();
                  },
                  child: Card(
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
                      color: AppColor.backgroundContainer
                    ),
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
            ),
            SizedBox(
              height: isKeyboardVisible
                  ? MediaQuery.of(context).viewInsets.bottom
                  : 0,
            ),
          ],
        ),
      ),
    );
  }
}
