import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import '../Theme/app_color.dart';
import '../Theme/app_textstyle.dart';

class CustomSideDrawer extends StatelessWidget {
  final VoidCallback onLogout;

  const CustomSideDrawer({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.backgroundContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.75,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(height: 100,),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        "assets/image/profile_image.png"), // replace with actual image
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning", style: AppTextStyles.drawerMinimal),
                      const SizedBox(height: 4),
                      const Text(
                          "Anna Stenkovic", style: AppTextStyles.drawerTitle),
                    ],
                  )
                ],
              ),
            ),
            // Drawer Items
            _drawerItem("editProfile.svg", "Edit Profile", () {}),
            _drawerItem("FAQ.svg", "FAQ", () {}),
            _drawerItem("contactUs.svg", "Contact Us", () {}),
            _drawerItem("aboutUs.svg", "About Us", () {}),
            _drawerItem("tellAFriend.svg", "Tell a Friend", () {}),
            _drawerItem("logout.svg", "Logout", onLogout,isLast: true),
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
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/$icon"),
                )),
          ),
          title: Text(title,style: AppTextStyles.drawerSubTitle,),
          onTap: onTap,
        ),
        if (!isLast)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: AppColor.dividerColor, height: 1),
          ),
      ],
    );
  }
}
