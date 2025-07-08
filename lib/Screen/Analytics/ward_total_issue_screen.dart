import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/common_appbar.dart';
import 'analytics_controller/ward_total_issue_controller.dart';

class WardTotalIssueScreen extends GetView<WardTotalIssueController> {
  const WardTotalIssueScreen({super.key});

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
          title: "Ward 21",
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildIssueTable(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildIssueTable() {
    return Container(
      // margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
            color: Colors.grey.withValues(alpha: 0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text("Issue", style: AppTextStyles.reportForm),
              ),
              Expanded(
                child: Text("Date Raised", style: AppTextStyles.reportForm),
              ),
              Expanded(
                child: Text("Status", style: AppTextStyles.reportForm),
              ),
            ],
          ),
          const Divider(thickness: 1, height: 20),
          ...controller.issues.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(item["issue"]!,
                      style: AppTextStyles.loginSubTitle),
                ),
                Expanded(
                  child: Text(item["date"]!,
                      style: AppTextStyles.loginSubTitle),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _buildStatusChip(item["status"]!),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    bool isResolved = status == "Resolved";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isResolved ? AppColor.resolvedColor : AppColor.inProgressColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(
          //   isResolved ? Icons.check_circle : Icons.timelapse,
          //   color: isResolved ? AppColor.resolvedColor: AppColor.inProgressColor,
          //   size: 16,
          // ),
          SvgPicture.asset(
              isResolved
                  ? "assets/icons/resolved.svg"
                  : "assets/icons/pending.svg"
          ),
          SizedBox(width: 2),
          Text(
            status,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              fontFamily: 'Nunito Sans',
              color: isResolved
                  ? AppColor.resolvedTextColor
                  : AppColor.inProgressTextColor,
            ),
          )
        ],
      ),
    );
  }
}
