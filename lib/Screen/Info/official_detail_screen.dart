import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/info/info_controller/official_detail_controller.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:ggram_online/Theme/app_textstyle.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';

class OfficialDetailScreen extends GetView<OfficialDetailController> {
  const OfficialDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          // appBar: const CommonAppBar(
          //   title: "",
          //   centerTitle: true,
          // ),
          body: SingleChildScrollView(
            child: Column(
              children: [_buildBody()],
            ),
          )),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 42,
          ),
          Container(
            // height: 420,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            // margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/icons/back.svg"),
                ),
                Center(
                  child: Container(
                      height: 176,
                      width: 176,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.backgroundContainer,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Colors.black.withValues(alpha: 0.2),
                          )
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/image/dummy.png",
                            fit: BoxFit.contain,
                          ))),
                ),
                Container(
                  height: 32,
                  width: 85,
                  margin: EdgeInsets.only(left: 200),
                  decoration: BoxDecoration(
                    color: AppColor.infoPageHeaderContainer,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                      child: Text(
                    "GMC",
                    style: AppTextStyles.infoContainerHeader,
                  )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    controller.official['name'] ?? '',
                    style: AppTextStyles.officialDetailTitle,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    controller.official['designation'] ?? '',
                    style: AppTextStyles.officialDetailSubTitle,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 2), // optional tweak for better alignment
                      child: SvgPicture.asset(
                        "assets/icons/location.svg",
                        height: 16,
                        width: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Expanded(
                      child: Text(
                        "Plot 3, Sector 65, MCG Office Floor 2 Gurugram",
                        style: AppTextStyles.reportForm,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        maxLines: null,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
      Row(
        children: [
          // Phone
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 5),
                  height: 32,
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
                    controller.official['phone'] ?? '+91-987654321',
                    style: AppTextStyles.phoneNumber,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -3,
                  child: SvgPicture.asset("assets/icons/call.svg"),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Email
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 0),
                  height: 32,
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
                    controller.official['email'] ?? 'raisinghrathee@gov.in',
                    style: AppTextStyles.phoneNumber,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -3,
                  child: SvgPicture.asset("assets/icons/email.svg"),
                ),
              ],
            ),
          ),
        ],
      )

      // Row(children: [
                //   SvgPicture.asset(
                //     "assets/icons/circle-phone.svg",
                //     height: 16,
                //     width: 16,
                //   ),
                //   const SizedBox(
                //     width: 5,
                //   ),
                //   Text(
                //     controller.official['phone'] ?? '',
                //     style: AppTextStyles.reportForm,
                //   ),
                // ]),
                // const SizedBox(
                //   height: 10,
                // ),
                // Row(children: [
                //   SvgPicture.asset(
                //     "assets/icons/envelope.svg",
                //     height: 16,
                //     width: 16,
                //   ),
                //   const SizedBox(
                //     width: 5,
                //   ),
                //   Text(
                //     controller.official['email'] ?? '',
                //     style: AppTextStyles.reportForm,
                //   ),
                // ]),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Reporting To",
            style: AppTextStyles.splashSubTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                height: 84,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Image
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
                      child: Image.asset(
                        "assets/image/dummy.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            "Aman Deep Singh",
                            style: AppTextStyles.splashSubTitle,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("ADC",
                              style: AppTextStyles.infoPageContainerSubTitle),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Reportees",
            style: AppTextStyles.splashSubTitle,
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                height: 84,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Image
                    Container(
                      height: 72,
                      width: 72,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
                      child: Image.asset(
                        "assets/image/dummy.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            "Aman Deep Singh",
                            style: AppTextStyles.splashSubTitle,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("ADC",
                              style: AppTextStyles.infoPageContainerSubTitle),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
