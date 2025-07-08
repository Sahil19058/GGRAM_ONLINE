import 'dart:ffi';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/home/home_controller/home_controller.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';

import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_textfield.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

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
          title: "Sector 65, Ward 26",
          leading: Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 14, left: 20),
            child: SvgPicture.asset("assets/icons/location.svg"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBody() {
    return ListView.builder(
      itemCount: controller.issueList.length,
      itemBuilder: (context, index) {
        final issue = controller.issueList[index];
        // Default to an empty list if reporters is null
        final reporters = issue['reporters'] ?? [];
        return Container(
          height: 655,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.backgroundContainer,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 2,
                spreadRadius: 0,
                color: Colors.grey.shade300,
              ),
            ]
          ),
          child: Column(
            children: [
              Container(
                height: 265,
                child: Stack(
                  children: [
                    Image.asset(
                      issue["image"],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 25,
                      left: 12,
                      child: Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 16, right: 80),
                              height: 42,
                              // width: Double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: AppColor.outlineMinimal),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, -2),
                                      blurRadius: 6,
                                      color: Colors.grey.shade300,
                                      inset: true
                                  ),
                                ],
                              ),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "+ 1 This issue",
                                style: AppTextStyles.phoneNumber,
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Positioned(
                              right: -10,
                              top: -4,
                              child: SvgPicture.asset("assets/icons/Like.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 32,
                      right: 12,
                      child: Expanded(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              height: 34,
                              // width: Double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.inProgressColor,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: AppColor.shadowColor,width: 1.58),
                              ),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/pending.svg",height: 15,width: 15,),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    issue["status"],
                                    style: AppTextStyles.phoneNumber,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(issue["title"],style: AppTextStyles.officialDetailTitle,),
                        Spacer(),
                        Text("${issue["ward"]}, ${issue["sector"]}",style: AppTextStyles.loginSubTitle),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Text("Counsellor",style: AppTextStyles.loginSubTitle),
                        Spacer(),
                        Text(issue["counsellor"],style: AppTextStyles.reportForm),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Text("Raised @",style: AppTextStyles.loginSubTitle),
                        Spacer(),
                        Text(issue["raised"],style: AppTextStyles.reportForm),
                      ],
                    ),
                    Divider(
                      color: AppColor.dividerColor,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(issue["description"],style: AppTextStyles.loginSubTitle),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 28,
                      width: 226,
                      color: AppColor.dividerColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RichText(text: TextSpan(
                      text: "Anna",style: AppTextStyles.userName,
                      children: [
                        TextSpan(text: " & ${issue["reportCount"].toString()} has reported this issue",style: AppTextStyles.reportForm),
                      ]
                    )),
                    SizedBox(
                      height: 16,
                    ),
                    TextFieldView(
                      hintText: "Comment here",
                      // suffixIcon: SvgPicture.asset("assets/image/profile_image.png"),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/profile_image.png"),
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}