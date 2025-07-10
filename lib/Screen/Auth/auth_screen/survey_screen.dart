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
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.backgroundContainer,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/image/Splash.png"),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.backgroundContainer.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 183,
                            width: 113,
                            child: Image.asset("assets/image/Survey_screen image.png")
                        ),
                        const Text("Select the top 3 Issues in your City.", style: AppTextStyles.authTitle),
                        const SizedBox(height: 10),
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
                        const Text(
                          "How satisfied are you with your city’s civic bodies (MCG, GMDA etc.)?",
                          style: AppTextStyles.drawerTitle,
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 8),
                            SliderTheme(
                              data: SliderTheme.of(Get.context!).copyWith(
                                trackHeight: 16,
                                activeTrackColor: AppColor.sliderColor,
                                inactiveTrackColor: AppColor.sliderColor,
                                thumbColor: Colors.transparent,
                                overlayColor: Colors.transparent,
                                overlayShape: SliderComponentShape.noOverlay,
                                thumbShape: _CustomVerticalThumb(),
                                tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 3),
                                activeTickMarkColor: AppColor.backgroundContainer,
                                inactiveTickMarkColor: AppColor.backgroundContainer,
                                // trackShape: _CustomVerticalThumb(), // Custom track!
                    
                              ),
                              child: Slider(
                                min: 0,
                                max: 10,
                                divisions: 10,
                                value: controller.satisfactionLevel.value.toDouble(),
                                onChanged: (value) {
                                  controller.satisfactionLevel.value = value.toInt();
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Extremely\nDissatisfied",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.sliderText,
                                ),
                                Text(
                                  "Extremely\nSatisfied",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.sliderText,
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    
                      const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: InnerShadowButton(
                            text: "Submit",
                            onPressed: () {
                              Get.toNamed(AppRoutes.supportScreen);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CustomVerticalThumb extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(20, 40);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
      required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter? labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow,
    }) {
    final paint = Paint()
      ..color = AppColor.buttonColor
      ..style = PaintingStyle.fill;

    final rect = Rect.fromCenter(center: center, width: 10, height: 60);
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(6));

    context.canvas.drawRRect(rRect, paint);
  }
}




