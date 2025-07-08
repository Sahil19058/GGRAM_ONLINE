import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlieGuruGramController extends GetxController{
  List<String> zoneList = ['Pothole', 'Broken Light', 'Flooded Road'];
  RxString? selectedZone = ''.obs;

  RxList<TreemapItem> items = <TreemapItem>[
    TreemapItem("Broken Roads", 60),
    TreemapItem("Waterlogging", 25),
    TreemapItem("Waste Burning", 15),
    TreemapItem("Uncollected Trash", 10),
    TreemapItem("Uncollected Trash", 5),
    TreemapItem("Uncollected Trash", 5),
    TreemapItem("Uncollected Trash", 5),
  ].obs;


  void updateData(List<TreemapItem> newItems) {
    items.value = newItems;
  }

  final List<Color> colors = [
    Color(0xFFB25E2C),
    Color(0xFFD18042),
    Color(0xFFE8A66C),
    Color(0xFFF2C28D),
    Color(0xFFF2D6B6),
  ];

}


class TreemapItem {
  final String title;
  final double value;

  TreemapItem(this.title, this.value);
}