import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/profile/profile_controller/profile_detail_controller.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import '../../Routes/route_name.dart';
import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';

class ProfileDetailScreen extends GetView<ProfileDetailController> {
  const ProfileDetailScreen({super.key});

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
        appBar: CommonAppBar(
          title: "Profile Details",
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.editProfileScreen);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/Edit.svg",
                    color: AppColor.textPrimary,
                  )),
            )
          ],
        ),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              height: 128,
              width: 128,
              margin: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/image/dummy.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Center(
            child: Text(
              "Natasha Stankovic",
              style: AppTextStyles.officialDetailTitle,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildContainer("Supporting Since", "May, 2022"),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildContainer("Issue Reported", "04"),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          _buildIssueTable(),
          const SizedBox(
            height: 24,
          ),
          Container(
            // margin: EdgeInsets.only(left: 180),
            height: 54,
            width: 197,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(30),
                border: Border.all(color: AppColor.textSecondary)),
            child: const Center(
              child: Text(
                "Delete Account",
                style: AppTextStyles.splashSubTitle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContainer(String title, String value) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: AppColor.backgroundContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 1,
            color: Colors.grey.withValues(alpha: 0.2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.reportForm,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppTextStyles.editProfileFontLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildIssueTable() {
    return Container(
      // margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.grey.withValues(alpha: 0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text("Issue", style: AppTextStyles.reportForm),
              ),
              Expanded(
                child: Text("Date Raised", style: AppTextStyles.reportForm),
              ),
              Expanded(
                child: Text("Status", style: AppTextStyles.reportForm),
              ),
            ],
          ),
          const Divider(thickness: 1, height: 20),
          ...controller.issues.map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(item["issue"]!,
                          style: AppTextStyles.loginSubTitle),
                    ),
                    Expanded(
                      child: Text(item["date"]!,
                          style: AppTextStyles.loginSubTitle),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _buildStatusChip(item["status"]!),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    bool isResolved = status == "Resolved";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isResolved ? AppColor.resolvedColor : AppColor.inProgressColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(
          //   isResolved ? Icons.check_circle : Icons.timelapse,
          //   color: isResolved ? AppColor.resolvedColor: AppColor.inProgressColor,
          //   size: 16,
          // ),
          SvgPicture.asset(isResolved
              ? "assets/icons/resolved.svg"
              : "assets/icons/pending.svg"),
          SizedBox(width: 2),
          Text(
            status,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito Sans',
              color: isResolved
                  ? AppColor.resolvedTextColor
                  : AppColor.inProgressTextColor,
            ),
          )
        ],
      ),
    );
  }
}
