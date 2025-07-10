import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Routes/route_name.dart';
import '../Theme/app_color.dart';
import '../Theme/app_textstyle.dart';

class CustomSideDrawer extends StatelessWidget {
  // final VoidCallback onLogout;

  const CustomSideDrawer({
    super.key,
  });
  // required this.onLogout

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.backgroundContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profileDetailScreen);
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          "assets/image/profile_image.png"), // replace with actual image
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning", style: AppTextStyles.drawerMinimal),
                      SizedBox(height: 4),
                      Text("Anna Stenkovic", style: AppTextStyles.drawerTitle),
                    ],
                  )
                ],
              ),
            ),
            // Drawer Items
            // _drawerItem("editProfile.svg", "Edit Profile", () {
            //   Get.back();
            //   Get.toNamed(AppRoutes.editProfileScreen);
            // }),
            _drawerItem("FAQ.svg", "FAQ", () {
              Get.toNamed(AppRoutes.faqScreen);
            }),
            _drawerItem("contactUs.svg", "Contact Us", () {
              Get.toNamed(AppRoutes.contactUsScreen);
            }),
            _drawerItem("aboutUs.svg", "About Us", () {}),
            _drawerItem("tellAFriend.svg", "Tell a Friend", () {}),
            _drawerItem("logout.svg", "Logout", () {}),
            const Spacer(),
            const Center(
                child: Text(
              "v1.0.0+build.456",
              style: AppTextStyles.drawerSubTitle,
            )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(String icon, String title, VoidCallback onTap,
      {bool isLast = false}) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                offset: const Offset(0, -4),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.shade300,
                inset: true,
                blurStyle: BlurStyle.inner,
              ),
            ]),
            child: Center(
              child: SvgPicture.asset("assets/icons/$icon"),
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.drawerSubTitle,
          ),
          onTap: onTap,
        ),
        if (!isLast)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: AppColor.dividerColor, height: 1),
          ),
      ],
    );
  }
}
