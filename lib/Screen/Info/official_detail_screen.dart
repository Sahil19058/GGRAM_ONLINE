import 'package:flutter/material.dart';
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
        appBar: const CommonAppBar(
          title: "Official’s Details",
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildBody()
            ],
          ),
        )
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 420,
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
              children: [
                Container(
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
                    )
                  )
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  controller.official['name'] ?? '',
                  style: AppTextStyles.officialDetailTitle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  controller.official['designation'] ?? '',
                  style: AppTextStyles.officialDetailSubTitle,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(children: [
                  SvgPicture.asset(
                    "assets/icons/circle-phone.svg",
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    controller.official['phone'] ?? '',
                    style: AppTextStyles.reportForm,
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SvgPicture.asset(
                    "assets/icons/envelope.svg",
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    controller.official['email'] ?? '',
                    style: AppTextStyles.reportForm,
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SvgPicture.asset(
                    "assets/icons/location.svg",
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Expanded(
                    child: Text(
                      "Plot 3, Sector 65, MCG Office Floor 2 Gurugram",
                      style: AppTextStyles.reportForm,
                      softWrap: true,
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Reporting To",style: AppTextStyles.splashSubTitle,),
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
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
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
          const Text("Reportees",style: AppTextStyles.splashSubTitle,),
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
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(14)),
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
