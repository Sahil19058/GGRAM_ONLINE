import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_checkbox.dart';
import '../../../Widgets/common_checkbox_with_textfieldview.dart';

import '../auth_controller/survey_controller.dart';

class SurveyScreen extends GetView<SurveyController> {
  const SurveyScreen({super.key});

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
        body:    Padding(
          padding:
          const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.backgroundContainer.withValues(alpha: 0.8),
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
                          const Text(
                            "in your City.",
                            style: AppTextStyles.authTitle,
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonCheckboxView(
                                label: "Broken Roads",
                                value: controller.brokenRoads,
                                onChanged: (_) => controller.toggleOption(controller.brokenRoads),
                              ),
                              CommonCheckboxView(
                                label: "Water Logging",
                                value: controller.waterLogging,
                                onChanged: (_) => controller.toggleOption(controller.waterLogging),
                              ),
                              CommonCheckboxView(
                                label: "No/Broken Footpaths",
                                value: controller.footpaths,
                                onChanged: (_) => controller.toggleOption(controller.footpaths),
                              ),
                              CommonCheckboxView(
                                label: "Dust",
                                value: controller.dust,
                                onChanged: (_) => controller.toggleOption(controller.dust),
                              ),
                              CommonCheckboxView(
                                label: "Pollution",
                                value: controller.pollution,
                                onChanged: (_) => controller.toggleOption(controller.pollution),
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
      ),
    );
  }
}
