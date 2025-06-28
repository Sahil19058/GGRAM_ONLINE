import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/info/info_binding/official_detail_binding.dart';
import 'package:ggram_online/Widgets/comoon_appbar.dart';

class OfficialDetailScreen extends GetView<OfficialDetailBining> {
  const OfficialDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          title: "Official’s Details",
        centerTitle: true,
      ),
    );
  }
}
