import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/home/home_controller/issue_detail_controller.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import '../../../Theme/app_color.dart';

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
          body: Column(
            children: [_buildBody()],
          )
      ),
    );
  }

  Widget _buildBody() {
    return const Column(
      children: [

      ],
    );
  }
}
