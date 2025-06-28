import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_checkbox.dart';
import '../../../Widgets/common_checkbox_with_textfieldview.dart';
import '../../../Widgets/common_textfield.dart';

import '../auth_controller/survey_controller.dart';

class SurveyScreen extends GetView<SurveyController> {
  const SurveyScreen({super.key});

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
                                  "Select the top 3 Issues",
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
                              "in your City.",
                              style: AppTextStyles.authTitle,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonCheckboxView(
                                  label: "Broken Roads",
                                  value: controller.brokenRoads, // RxBool from controller
                                  onChanged: (val) => controller.brokenRoads.value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "Water Logging",
                                  value: controller.waterLogging, // RxBool from controller
                                  onChanged: (val) => controller.waterLogging.value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "No/Broken Footpaths",
                                  value: controller.footpaths, // RxBool from controller
                                  onChanged: (val) => controller.footpaths.value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "Dust",
                                  value: controller.dust, // RxBool from controller
                                  onChanged: (val) => controller.dust.value = val ?? false,
                                ),
                                CommonCheckboxView(
                                  label: "Pollution",
                                  value: controller.pollution, // RxBool from controller
                                  onChanged: (val) => controller.pollution.value = val ?? false,
                                ),
                                CommonCheckboxWithTextFieldView(
                                  label: "Others",
                                  value: controller.others,
                                  controller: controller.otherController,
                                  onChanged: (val) => controller.others.value = val ?? false,
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
                                Get.toNamed(RouteName.supportScreen);
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
