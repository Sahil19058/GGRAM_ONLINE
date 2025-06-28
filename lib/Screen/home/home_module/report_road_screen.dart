import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:ggram_online/Widgets/comoon_appbar.dart';

import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_textfield.dart';
import '../../../Widgets/custom_popup.dart';
import '../home_controller/report_road_controller.dart';


class ReportRoadScreen extends GetView<ReportRoadController> {
  ReportRoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CommonAppBar(
        title: "Report Road Issue",
        centerTitle: true,
      ),
      backgroundColor: AppColor.backgroundContainer,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/Splash.png'),
            opacity: 0.2,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildBody(screenWidth),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
              child: InnerShadowButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => CustomCommonPopup(
                      title: "Thank You!",
                      subtitle:
                      "Thank you for making Gurugram Better. We will get back to you soon!",
                      onContinue: () {},
                      showButton: false,
                      body:Row(
                        spacing: 5,
                      children: const [
                          ReportStatCard(count: "25", title: "Potholes\nReported"),
                          ReportStatCard(count: "04", title: "Water\nLogging"),
                          ReportStatCard(count: "12", title: "Broken\nFootpath"),
                        ],
                      )
                    ),
                  );
                  Future.delayed(const Duration(seconds: 3), () {
                    Get.offAllNamed(RouteName.bottomNavBar); // navigate to Home
                  });
                },
                text: "Submit",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please share a few more details about the issue.",
          style: AppTextStyles.loginSubTitle,
        ),
        const SizedBox(height: 24),
        Text("Issue Type", style: AppTextStyles.reportForm),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColor.textFiledBackground,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonFormField<String>(
            value: controller.selectedIssue?.value.isNotEmpty == true
                ? controller.selectedIssue?.value
                : null,
            decoration: const InputDecoration(border: InputBorder.none),
            icon: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/image/Vector.png"),
            ),
            hint: const Text("Select", style: TextStyle(color: AppColor.textPrimary)),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Issue type is required';
              }
              return null;
            },
            items: controller.issueType.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.selectedIssue?.value = newValue!;
            },
          ),
        ),
        const SizedBox(height: 20),
        TextFieldView(
          title: "Issue Type (Optional)",
          hintText: "Add details...",
          minLines: 5,
        ),
        const SizedBox(height: 20),
        Text("Upload Photo", style: AppTextStyles.reportForm),
        const SizedBox(height: 8),
        Obx(() {
          final image = controller.uploadedImage.value;
          return GestureDetector(
            onTap: () => Get.toNamed(RouteName.uploadImageScreen),
            child: Container(
              height: image != null ? 200 : 112,
              width: double.infinity,
              child: DottedBorder(
                color: AppColor.outlineBorder,
                strokeWidth: 2.0,
                dashPattern: const [4, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(16),
                child: image != null && image.path.isNotEmpty
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                    : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/upload.svg"),
                      const SizedBox(height: 10),
                      Text("Upload from Device", style: AppTextStyles.reportForm),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class ReportStatCard extends StatelessWidget {
  final String count;
  final String title;

  const ReportStatCard({
    super.key,
    required this.count,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColor.backgroundContainer,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 28,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: AppColor.buttonColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColor.textSecondary,
              fontWeight: FontWeight.w500,
              height: 1.3,
              fontFamily: 'Inter'
            ),
          ),
        ],
      ),
    );
  }
}
