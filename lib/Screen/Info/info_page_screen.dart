import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Screen/info/info_controller/info_page_controller.dart';
import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/common_textfield.dart';
import '../../Widgets/common_appbar.dart';
import '../../Widgets/custom_drawer.dart';
import '../BottomNavBar/bottom_nav_bar_controller.dart';

class InfoPageScreen extends GetView<InfoPageController> {
  const InfoPageScreen({super.key});

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
        drawer: const CustomSideDrawer(),
        backgroundColor: Colors.transparent,
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
          leading: Container(
            margin: const EdgeInsets.only(left: 19),
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildBody()],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldView(
          title: "Search Address",
          hintText: "Search here",
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
        ),
        const SizedBox(height: 25),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _InfoCard(count: "21", label: "Ward"),
            _InfoCard(count: "03", label: "Zone"),
            _InfoCard(count: "65", label: "Sector"),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.officials.length,
          itemBuilder: (context, index) {
            final official = controller.officials[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.officialDetailScreen,
                    arguments: official
                );
              },
              child: Container(
                height: 127,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.backgroundContainer,
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
                      height: 115,
                      width: 108,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        official["image"] ?? "assets/image/default.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            official["name"] ?? "",
                            style: AppTextStyles.infoPageContainerTitle,
                          ),
                          Text(
                            official["designation"] ?? "",
                            style: AppTextStyles.infoPageContainerSubTitle,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/circle-phone.svg"),
                              const SizedBox(width: 5),
                              Text(
                                official["phone"] ?? "",
                                style: AppTextStyles.phoneNumber,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/envelope.svg"),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  official["email"] ?? "",
                                  style: AppTextStyles.phoneNumber,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        const Text(
          "Executive Engineers",
          style: AppTextStyles.splashSubTitle,
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Aman Deep Singh",
                          style: AppTextStyles.splashSubTitle,
                        ),
                        const Text("Joint Secretary",
                            style: AppTextStyles.infoSmallSubTitle),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/circle-phone.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "+91-987654321",
                              style: AppTextStyles.phoneNumber,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset("assets/icons/envelope.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                                child: Text(
                              "raisinghrathee@gov.in",
                              style: AppTextStyles.phoneNumber,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 50,
        )
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
    return Container(
      height: 120,
      width: (MediaQuery.of(context).size.width - 48) / 3, // 16 + 16 + 16 spacing
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
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const Spacer(),
              SvgPicture.asset("assets/icons/interrogation.svg")
            ],
          ),
          FittedBox(
            child: Text(
              count,
              style: const TextStyle(
                color: AppColor.buttonColor,
                fontSize: 48,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter'
              ),
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: AppColor.textSecondary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'
            ),
          ),
        ],
      ),
    );
  }
}
