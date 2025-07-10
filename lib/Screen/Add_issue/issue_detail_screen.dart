import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Theme/app_textstyle.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import 'package:ggram_online/Widgets/common_button.dart';
import '../../Theme/app_color.dart';
import '../../Widgets/custom_popup.dart';
import 'add_issue_controller/issue_detail_controller.dart';

class IssueDetailScreen extends GetView<IssueDetailController> {
  const IssueDetailScreen({super.key});

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
        appBar: const CommonAppBar(
          title: "Report Road Issue",
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [_buildBody(context)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Is this issue the same as the one below?",
          style: AppTextStyles.reportRoadTitle,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.issues.length,
          itemBuilder: (context, index) {
            final issue = controller.issues[index];
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 16),
              height: 208,
              decoration: BoxDecoration(
                color: AppColor.backgroundContainer,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 65,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DottedBorder(
                          dashPattern: const [4, 4],
                          color: AppColor.outlineBorder,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: issue["image"] is File ? Image.file(
                              issue["image"] as File,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ) : (issue["image"] != null &&
                                (issue["image"] as String).isNotEmpty)
                                ? Image.asset(
                              issue["image"] as String,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            )
                                : Container(
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: Text(
                                  "No Image",
                                  style: TextStyle(
                                      color: AppColor.textPrimary),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  issue["title"],
                                  style: AppTextStyles.reportRoadCardTitle,
                                ),
                                const Spacer(),
                                Text(
                                  "${issue["ward"]},",
                                  style: AppTextStyles.reportRoadCardSubTitle,
                                ),
                                Text(
                                  issue["sector"],
                                  style: AppTextStyles.reportRoadCardSubTitle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Counsellor",
                                  style: AppTextStyles.reportRoadCardSubTitle,
                                ),
                                const Spacer(),
                                Text(
                                  issue["counsellor"],
                                  style: AppTextStyles.phoneNumber,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Raised @",
                                  style: AppTextStyles.reportRoadCardSubTitle,
                                ),
                                const Spacer(),
                                Text(
                                  issue["raised"],
                                  style: AppTextStyles.phoneNumber,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    issue["description"],
                    style: AppTextStyles.reportRoadCardDescription,
                  ),
                  Row(
                    children: [
                      Text(
                        "${issue["reportCount"]} People reported this issue",
                        style: AppTextStyles.reportRoadCardPeopleCount,
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/icons/Green Check circle.svg"),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 17,
                        width: 65,
                        decoration: BoxDecoration(
                          color: AppColor.inProgressColor,
                          borderRadius: BorderRadius.circular(9),
                          border:
                              Border.all(color: AppColor.inProgressTextColor),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/pending.svg"),
                            Text(
                              issue["status"],
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Nunito Sans',
                                color: AppColor.inProgressTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InnerShadowButton(
                    height: 42,
                    text: "${issue["distance"]}",
                    onPressed: () {
                      showDialog(context: context, builder: (_) => CustomCommonPopup(
                        imagePath: "assets/image/report_road_issue.png",
                        title: "Merging Issue",
                        subtitle: "Will be added to Existing Issue.",
                        body: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  },
                                child: Container(
                                  height: 54,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(30),
                                    color: AppColor.dialogButtonSecondary
                                  ),
                                  child: const Center(
                                    child: Text("Cancel", style: TextStyle(
                                    color: AppColor.backgroundContainer,
                                    fontWeight: FontWeight.bold),
                                  )
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: InnerShadowButton(
                                text: "Yes",
                                onPressed: () {
                                  // Step 1: Navigate to bottom navbar
                                  Get.offAllNamed(AppRoutes.bottomNavBar);

                                  // Step 2: Show dialog after navigation completes
                                  Future.delayed(const Duration(milliseconds: 300), () {
                                    showDialog(
                                      context: Get.context!, // Use global context after navigation
                                      barrierDismissible: false,
                                      builder: (context) {
                                        // Auto-dismiss the dialog after 3 seconds
                                        Future.delayed(const Duration(seconds: 3), () {
                                          if (Navigator.of(context).canPop()) {
                                            Navigator.of(context).pop();
                                          }
                                        });

                                        return const CustomCommonPopup(
                                          title: "Thank You!",
                                          subtitle: "Thank you for making Gurugram Better We will get back to you soon!",
                                          body: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              _InfoCard(count: "25", label: "Potholes\nReported"),
                                              _InfoCard(count: "04", label: "Water\nLogging"),
                                              _InfoCard(count: "12", label: "Broken\nFootpath"),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        // Get.offAllNamed(AppRoutes.bottomNavBar),
                        // showButton: true,
                      ));
                    },
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InnerShadowButton(
            text: "NO - My issue is different",
            onPressed: () {
              // Step 1: Navigate to bottom navbar
              Get.offAllNamed(AppRoutes.bottomNavBar);

              // Step 2: Show dialog after navigation completes
              Future.delayed(const Duration(milliseconds: 300), () {
                showDialog(
                  context: Get.context!, // Use global context after navigation
                  barrierDismissible: false,
                  builder: (context) {
                    // Auto-dismiss the dialog after 3 seconds
                    Future.delayed(const Duration(seconds: 3), () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    });

                    return const CustomCommonPopup(
                      title: "Thank You!",
                      subtitle: "Thank you for making Gurugram Better We will get back to you soon!",
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _InfoCard(count: "25", label: "Potholes\nReported"),
                          _InfoCard(count: "04", label: "Water\nLogging"),
                          _InfoCard(count: "12", label: "Broken\nFootpath"),
                        ],
                      ),
                    );
                  },
                );
              });
            },
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String count;
  final String label;

  const _InfoCard({
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.outlineMinimal, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                count,
                style: const TextStyle(
                  color: AppColor.buttonColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            // const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColor.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
