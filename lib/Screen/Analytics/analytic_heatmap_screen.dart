import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/Analytics/widgets/aile_gurugram_widget.dart';
import 'package:ggram_online/Screen/Analytics/widgets/heatmap_widget.dart';
import 'package:ggram_online/Screen/Analytics/widgets/wardis_doing_widget.dart';
import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/custom_drawer.dart';
import 'analytics_controller/analytics_heatmap_controller.dart';

class AnalyticHeatmapScreen extends GetView<HeatmapController> {
  const AnalyticHeatmapScreen({super.key});

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Material(
            elevation: 4,
            shadowColor: Colors.grey.withValues(alpha: 0.2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.backgroundContainer,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
              ),
              padding: const EdgeInsets.only(left: 16, right: 10, top: 5),
              child: SafeArea(
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Analytics",
                              style: AppTextStyles.drawerTitle),
                          Obx(() => Text(
                            controller.currentPage.value == 0
                              ? "Issue Heatmap"
                              : controller.currentPage.value == 1
                                ? "How your Ward is doing?"
                                : "What ails Gurugram ?",
                            style: AppTextStyles.appbarSubTitle),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/icons/menu.svg'),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.changePage,
                children: [
                  _PageContent(child: const HeatmapWidget()),
                  _PageContent(child: const WardIsDoingWidget()),
                  _PageContent(child: const AileGuruGramWidget()),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                bool isActive = index == controller.currentPage.value;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: isActive ? 14 : 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive
                      ? Colors.transparent
                      : AppColor.buttonColor,
                    // borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.buttonColor,
                      width: 1.5,
                    ),
                  ),
                );
               }),
              )),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _PageContent({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: child,
    );
  }
}

// class _PageContent extends StatelessWidget {
//   final Widget child;
//
//   const _PageContent({required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//       child: child,
//     );
//   }
// }
