import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../Theme/app_color.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_textfield.dart';
import '../analytics_controller/ward_doing_controller.dart';

class WardIsDoingWidget extends GetView<WardDoingController> {
  const WardIsDoingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.backgroundContainer,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -4),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Colors.grey.shade300,
                    inset: true,
                    blurStyle: BlurStyle.inner,
                  ),
                ]
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Current Location",
                    style: AppTextStyles.currentLocation,
                  ),
                  const Spacer(),
                  const Text(
                    "Ward 21",
                    style: AppTextStyles.currentLocationWard,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            TextFieldView(
              title: "Search Address",
              hintText: "Search here",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.outlineMinimal, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Center(
                    child: Row(
                  children: [
                    Text(
                      "Reported Issues",
                      style: AppTextStyles.reportForm,
                    ),
                    Spacer(),
                    FittedBox(
                        child: Text("138", style: AppTextStyles.reportIssueCount))
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.outlineMinimal, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Center(
                    child: Row(
                  children: [
                    Text(
                      "Total Resolved Issues",
                      style: AppTextStyles.reportForm,
                    ),
                    Spacer(),
                    FittedBox(
                        child: Text("60", style: AppTextStyles.resolveCount))
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.outlineMinimal, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Background Fill Bar
                  FractionallySizedBox(
                    widthFactor:
                        controller.resolutionPercent.value, // 0.7 for 70%
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.resolutionColor,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(35)),
                      ),
                    ),
                  ),
                  // Foreground Text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Row(
                        children: [
                          const Text("Resolution", style: AppTextStyles.reportForm),
                          const Spacer(),
                          FittedBox(
                            child: Text(
                              "${(controller.resolutionPercent * 100).toStringAsFixed(0)}%", // e.g., "70%"
                              style: AppTextStyles.resolveCount,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
