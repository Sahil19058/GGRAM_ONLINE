import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Add_issue/add_issue_screen.dart';
import '../Analytics/analytic_heatmap_screen.dart';
import '../home/home_module/home_screen.dart';
import '../info/info_page_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  final List<Widget> pages = [
    HomeScreen(),
    AddIssueScreen(),
    InfoPageScreen(),
    AnalyticHeatmapScreen()
  ];

  final List<String> svgIcons = [
    'assets/icons/home.svg',
    'assets/icons/Fill_pluse.svg',
    'assets/icons/info.svg',
    'assets/icons/analytics.svg',
  ];


  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer(); // Use openEndDrawer for right-side drawer
  }
}
