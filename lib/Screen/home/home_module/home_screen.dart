import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/home/home_controller/home_controller.dart';
import 'package:ggram_online/Theme/app_color.dart';
import '../../../Routes/route_name.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/comoon_appbar.dart';
import '../../../Widgets/custom_drawer.dart';
import '../../BottomNavBar/bottom_nav_bar_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSideDrawer(
        onLogout: () {
          // Perform logout logic
        },
      ),
      backgroundColor: AppColor.backgroundContainer,
      appBar: CommonAppBar(
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
        title: 'Sector 64',
        leading: Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                offset: const Offset(0, -6),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.shade300,
                inset: true,
                blurStyle: BlurStyle.inner,
              ),
            ]),
            child: Center(
                child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/landmark.svg"),
            )),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/Splash.png'),
            opacity: 0.2,
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [_buildBody()],
          ),
        ),
      ),
    );
  }
}

Widget _buildBody() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Container(
          height: 414,
          decoration: BoxDecoration(
              color: AppColor.buttonColor,
              borderRadius: BorderRadius.circular(16)),
          // child: GoogleMap(
          //   initialCameraPosition: CameraPosition(
          //     target: LatLng(37.7749, -122.4194), // Example: San Francisco
          //     zoom: 12,
          //   ),
          //   onMapCreated: (GoogleMapController controller) {
          //     // You can keep the controller if needed
          //   },
          //   myLocationEnabled: true,
          //   zoomControlsEnabled: false,
          // ),
        ),
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
                Get.toNamed(RouteName.reportRoadScreen);
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

Widget _buildContainer(String iconPath, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 148,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.backgroundContainer,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.grey.shade300,
          )
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
