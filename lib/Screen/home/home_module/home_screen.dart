import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/home/home_controller/home_controller.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Routes/route_name.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_appbar.dart';
import '../../../Widgets/custom_drawer.dart';
import '../../BottomNavBar/bottom_nav_bar_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.backgroundContainer,
        image: DecorationImage(
          image: AssetImage('assets/image/Splash.png'),
          opacity: 0.2,
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: CustomSideDrawer(
          onLogout: () {
            // Perform logout logic
          },
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Obx(() => CommonAppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        Get.find<BottomNavController>().openDrawer();
                      },
                      icon: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  )
                ],
                title: controller.currentSector.value.isEmpty
                    ? "Locating..."
                    : controller.currentSector.value,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 19),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -6),
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: Colors.grey.shade300,
                          inset: true,
                          blurStyle: BlurStyle.inner,
                        ),
                      ],
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/landmark.svg"),
                      ),
                    ),
                  ),
                ),
              )),
        ),

        // body: Container(
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/image/Splash.png'),
        //       opacity: 0.2,
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [_buildBody()],
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [_buildBody()],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Obx(() => Container(
              height: 414,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
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
                  Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer()),
                },
              ))),

          /// DELHI EXAMPLE
          // Container(
          //   height: 414,
          //   decoration: BoxDecoration(
          //     color: AppColor.buttonColor,
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   clipBehavior: Clip.antiAlias,
          //   child: GoogleMap(
          //     initialCameraPosition: const CameraPosition(
          //       target: LatLng(28.7215, 77.1110), // Example location: Rohini
          //       zoom: 17,
          //     ),
          //     myLocationButtonEnabled: false,
          //     myLocationEnabled: true,
          //     zoomControlsEnabled: false,
          //     mapType: MapType.normal,
          //     gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          //       Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
          //     },
          //     onMapCreated: (GoogleMapController controller) async {
          //       try {
          //         List<Placemark> placemarks = await placemarkFromCoordinates(
          //           28.7215,
          //           77.1110,
          //         );
          //
          //         if (placemarks.isNotEmpty) {
          //           Placemark place = placemarks.first;
          //           String sector = place.subLocality ?? place.locality ?? place.name ?? "Unknown";
          //           print("📍 Sector/Locality: $sector");
          //         }
          //       } catch (e) {
          //         print("❌ Error while fetching location: $e");
          //       }
          //     },
          //   ),
          // ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildContainer("assets/icons/trash.svg", "Report Trash\nIssue",
                    () {
                  // Handle tap
                }),
                const SizedBox(width: 16),
                _buildContainer("assets/icons/road.svg", "Report Road \nIssue",
                    () {
                  // Handle tap
                  // Get.toNamed(RouteName.reportRoadScreen);
                  Get.toNamed(RouteName.uploadImageScreen);
                }),
                const SizedBox(width: 16),
                _buildContainer("assets/icons/road.svg", "Report Road \nIssue",
                    () {
                  // Handle tap
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

Widget _buildContainer(String iconPath, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 148,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.backgroundContainer,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.buttonColor,
              ),
              child: Center(
                child: SvgPicture.asset(iconPath),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: AppTextStyles.loginSubTitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
