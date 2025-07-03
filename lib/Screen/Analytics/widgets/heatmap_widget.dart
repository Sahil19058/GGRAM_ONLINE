import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/Analytics/analytics_controller/analytics_heatmap_controller.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:ggram_online/Theme/app_textstyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
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
                  SvgPicture.asset('assets/icons/location.svg',height: 24,width: 24,),
                  const SizedBox(width: 8,),
                  const Text("Current Location",style: AppTextStyles.currentLocation,),
                  const Spacer(),
                  const Text("Ward 21",style: AppTextStyles.currentLocationWard,)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              clipBehavior: Clip.antiAlias,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.currentLatLng.value,
                  zoom: 17,
                ),
                myLocationButtonEnabled: false,
                onMapCreated: controller.onMapCreated,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // 🔹 Ward View (selected)
                  Container(
                    height: 50,
                    width: 122,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color:AppColor.outlineMinimal, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Ward View",
                        style: AppTextStyles.splashSubTitle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // 🔹 Zone View
                  Container(
                    height: 50,
                    width: 122,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(color:AppColor.outlineMinimal, width: 1),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: Colors.grey.shade300,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Zone View",
                        style: AppTextStyles.splashSubTitle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // 🔹 Sector View
                  Container(
                    height: 50,
                    width: 122,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(color:AppColor.outlineMinimal, width: 1),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 2,
                          spreadRadius: 0,
                          inset: false,
                          color: Colors.grey.shade300,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Sector View",
                        style: AppTextStyles.splashSubTitle,
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
