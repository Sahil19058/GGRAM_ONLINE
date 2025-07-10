import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/common_textfield.dart';
import 'add_issue_controller/report_road_controller.dart';


class ReportRoadScreen extends GetView<ReportRoadController> {
  const ReportRoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
        appBar: const CommonAppBar(
          title: "Report Road Issue",
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
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
                  Get.toNamed(AppRoutes.issueDetailScreen,);
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
        const Text(
          "Please share a few more details about the issue.",
          style: AppTextStyles.infoPageContainerTitle,
        ),
        const SizedBox(height: 24),
        const Text("Issue Type", style: AppTextStyles.reportForm),
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
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/icons/Vector.png"),
            ),
            hint: const Text("Please Select",
                style: TextStyle(color: AppColor.textPrimary)),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Issue type is required';
              }
              return null;
            },
            borderRadius: BorderRadius.circular(20),
            dropdownColor: AppColor.backgroundContainer,
            items: controller.issueType.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style: AppTextStyles.currentLocation,),
              );
            }).toList(),
            onChanged: (newValue) {
              controller.selectedIssue?.value = newValue!;
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Obx(() {
              return GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.uploadImageScreen),
                child: Container(
                  height: 186,
                  width: 198,
                  child: DottedBorder(
                    padding: EdgeInsets.all(6),
                    color: AppColor.outlineBorder,
                    strokeWidth: 2.0,
                    dashPattern: const [4, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: controller.uploadedImage.value != null
                          ? Image.file(
                        controller.uploadedImage.value!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      )
                          : Container(
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: Text(
                            "No Image",
                            style: TextStyle(color: AppColor.textPrimary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(width: 15),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sectore: ",style: AppTextStyles.reportRoadDetail),
                Text("Ward: ",style: AppTextStyles.reportRoadDetail),
                Text("Counsellor:",style: AppTextStyles.reportRoadDetail),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        const TextFieldView(
          hintText: "Can You Add some more  details...",
          minLines: 5,
        ),

        // const Text("Upload Photo", style: AppTextStyles.reportForm),
        // const SizedBox(height: 8),

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
        boxShadow: const [
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
