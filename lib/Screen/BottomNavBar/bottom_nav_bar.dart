import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ggram_online/Theme/app_color.dart';
import '../../Widgets/custom_drawer.dart';
import '../home/home_screen.dart';
import '../info/info_page_screen.dart';
import 'bottom_nav_bar_controller.dart';

class BottomNavBar extends GetView<BottomNavController> {

  final List<Widget> pages = [
    HomeScreen(),
    InfoPageScreen(),
    Center(child: Text("Analytics Page", style: TextStyle(fontSize: 22))),
  ];

  final List<String> svgIcons = [
    'assets/icons/home.svg',
    'assets/icons/info.svg',
    'assets/icons/analytics.svg',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: controller.scaffoldKey,
      drawer: CustomSideDrawer(onLogout: () {
        // handle logout
      }),
      extendBody: true,
      backgroundColor: Colors.grey[200],
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(svgIcons.length, (index) {
                  final isSelected = controller.selectedIndex.value == index;
                  return IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    icon: SvgPicture.asset(
                      svgIcons[index],
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? AppColor.buttonColor
                            : AppColor.unSelectButton,
                        BlendMode.srcIn,
                      ),
                      width: 28,
                      height: 28,
                    ),
                    onPressed: () {
                      controller.changeIndex(index);
                    },
                  );
                }),
              )),
        ),
      ),
    );
  }
}
