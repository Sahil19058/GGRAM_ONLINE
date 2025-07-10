import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ggram_online/Screen/Analytics/analytics_controller/analytics_heatmap_controller.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:ggram_online/Theme/app_textstyle.dart';

class HeatmapWidget extends GetView<HeatmapController> {
  const HeatmapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 55,
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
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/location.svg', height: 24, width: 24),
                  const SizedBox(width: 8),
                  const Text("Current Location", style: AppTextStyles.currentLocation),
                  const Spacer(),
                  Obx(() => Text(
                    controller.currentSector.value,
                    style: AppTextStyles.currentLocationWard,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              clipBehavior: Clip.antiAlias,
              child: Obx(() => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.currentLatLng.value,
                  zoom: 17,
                ),
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                heatmaps: controller.heatmaps,
                onMapCreated: controller.onMapCreated,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                },
              )),
            ),
            const SizedBox(height: 10),
            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(controller.views.length, (index) {
                  bool isSelected = controller.selectedIndex.value == index;
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.selectedIndex.value = index,
                        child: Container(
                          height: 50,
                          width: 122,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColor.buttonColor : Colors.white,
                            borderRadius: BorderRadius.circular(27),
                            border: Border.all(color: AppColor.outlineMinimal, width: 1),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 2,
                                spreadRadius: 0,
                                color: Colors.grey.shade300,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              controller.views[index],
                              style: AppTextStyles.splashSubTitle.copyWith(
                                color: isSelected
                                    ? AppColor.backgroundContainer
                                    : AppColor.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (index != controller.views.length - 1) const SizedBox(width: 16),
                    ],
                  );
                }),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
