
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Routes/route_name.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_checkbox.dart';
import '../../../Widgets/common_checkbox_with_textfieldview.dart';
import '../../../Widgets/custom_popup.dart';
import '../auth_controller/support_controller.dart';

class SupportScreen extends GetView<SupportController> {
  const SupportScreen({super.key});

  @override
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
          margin:
              const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
          decoration: BoxDecoration(
            color: AppColor.backgroundContainer.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(40),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Want to help make our",
                        style: AppTextStyles.authTitle,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Handle skip logic here
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
                  const Text(
                    "City better?",
                    style: AppTextStyles.authTitle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Share your thoughts!",
                    style: AppTextStyles.loginSubTitle,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonCheckboxView(
                        label: "Front End / Back End Design",
                        value: controller.frontendBackEndDesign,
                        onChanged: (_) => controller.toggleOption(controller.frontendBackEndDesign),
                      ),
                      CommonCheckboxView(
                        label: "Research",
                        value: controller.research,
                        onChanged: (_) => controller.toggleOption(controller.research),
                      ),
                      CommonCheckboxView(
                        label: "On-Ground Volunteering",
                        value: controller.onGroundVolunteering,
                        onChanged: (_) => controller.toggleOption(controller.onGroundVolunteering),
                      ),
                      CommonCheckboxView(
                        label: "Marketing",
                        value: controller.marketing,
                        onChanged: (_) => controller.toggleOption(controller.marketing),
                      ),
                      CommonCheckboxView(
                        label: "Content Creation",
                        value: controller.contentCreation,
                        onChanged: (_) => controller.toggleOption(controller.contentCreation),
                      ),
                      CommonCheckboxView(
                        label: "Fundraising / Sponsorship",
                        value: controller.fundraisingSponsorship,
                        onChanged: (_) => controller.toggleOption(controller.fundraisingSponsorship),
                      ),
                      CommonCheckboxWithTextFieldView(
                        label: "Others",
                        value: controller.others,
                        controller: controller.otherController,
                        onChanged: (_) => controller.toggleOption(controller.others),
                        hintText: "Enter Details",
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Spacer(),
                  InnerShadowButton(
                    text: "Submit",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomCommonPopup(
                          title: "All Set!",
                          subtitle:
                              "Let’s improve our city for a brighter future.",
                          onContinue: () =>
                              Get.offAllNamed(RouteName.bottomNavBar),
                          showButton: true,
                        ),
                      );
                    },
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
