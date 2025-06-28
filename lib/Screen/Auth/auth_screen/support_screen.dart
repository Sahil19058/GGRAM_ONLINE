import 'dart:async';

import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/image/Splash.png",
            fit: BoxFit.fill,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.backgroundContainer.withOpacity(0.8),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 120,
                    ),
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
                            Text(
                              "City better?",
                              style: AppTextStyles.authTitle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Share your thoughts!",
                              style: AppTextStyles.loginSubTitle,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonCheckboxView(
                                  label: "Front End / Back End Design",
                                  value: controller
                                      .frontendBackEndDesign, // RxBool from controller
                                  onChanged: (val) => controller
                                      .frontendBackEndDesign
                                      .value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "Research",
                                  value: controller
                                      .research, // RxBool from controller
                                  onChanged: (val) =>
                                      controller.research.value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "On-Ground Volunteering",
                                  value: controller
                                      .onGroundVolunteering, // RxBool from controller
                                  onChanged: (val) => controller
                                      .onGroundVolunteering
                                      .value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "Marketing",
                                  value: controller
                                      .marketing, // RxBool from controller
                                  onChanged: (val) =>
                                      controller.marketing.value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "Content Creation",
                                  value: controller
                                      .contentCreation, // RxBool from controller
                                  onChanged: (val) => controller
                                      .contentCreation.value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "Fundraising / Sponsorship",
                                  value: controller
                                      .fundraisingSponsorship, // RxBool from controller
                                  onChanged: (val) => controller
                                      .contentCreation.value = val ?? false,
                                ),
                                CommonCheckboxWithTextFieldView(
                                  label: "Others",
                                  value: controller.others,
                                  controller: controller.otherController,
                                  onChanged: (val) =>
                                      controller.others.value = val ?? false,
                                  hintText: "Enter Details",
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Spacer(),
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
                                    Timer(Duration(seconds: 3), () =>
                                        Get.offAllNamed(RouteName.bottomNavBar),
                                    ),
                                    showButton: true,
                                  ),
                                );
                              },
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
