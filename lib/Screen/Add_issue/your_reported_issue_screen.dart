import 'package:flutter/material.dart';

import '../../Theme/app_color.dart';
import '../../Widgets/common_appbar.dart';

class YourReportedIssueScreen extends StatelessWidget {
  const YourReportedIssueScreen({super.key});

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
          title: "Your Reported Issues",
          centerTitle: true,
        ),
        // body: Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [_buildBody(context)],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
