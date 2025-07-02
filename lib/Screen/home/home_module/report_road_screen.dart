import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import '../../../Theme/app_textstyle.dart';
import '../../../Widgets/common_button.dart';
import '../../../Widgets/common_textfield.dart';
import '../home_controller/report_road_controller.dart';

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
                // onPressed: () {
                //   showDialog(
                //     context: context,
                //     builder: (_) => CustomCommonPopup(
                //         title: "Thank You!",
                //         subtitle:
                //             "Thank you for making Gurugram Better. We will get back to you soon!",
                //         onContinue: () {},
                //         showButton: false,
                //         body: const Row(
                //           spacing: 5,
                //           children: [
                //             ReportStatCard(
                //                 count: "25", title: "Potholes\nReported"),
                //             ReportStatCard(
                //                 count: "04", title: "Water\nLogging"),
                //             ReportStatCard(
                //                 count: "12", title: "Broken\nFootpath"),
                //           ],
                //         )),
                //   );
                //   Future.delayed(const Duration(seconds: 3), () {
                //     Get.offAllNamed(RouteName.bottomNavBar); // navigate to Home
                //   });
                // },
                onPressed: () {
                  Get.toNamed(RouteName.issueDetailScreen,);
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
          style: AppTextStyles.loginSubTitle,
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
              final image = controller.uploadedImage.value;
              return GestureDetector(
                onTap: () => Get.toNamed(RouteName.uploadImageScreen),
                child: SizedBox(
                  height:  186 ,
                  width:163,
                  child: DottedBorder(
                    color: AppColor.outlineBorder,
                    strokeWidth: 2.0,
                    dashPattern: const [4, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(16), child: SizedBox(),
                    // child: image != null && image.path.isNotEmpty
                    //     ? ClipRRect(
                    //   borderRadius: BorderRadius.circular(16),
                    //   child: Image.file(
                    //     image,
                    //     fit: BoxFit.cover,
                    //     width: double.infinity,
                    //   ),
                    // )
                    //     : Center(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       SvgPicture.asset("assets/icons/upload.svg"),
                    //       const SizedBox(height: 10),
                    //       const Text("Upload from Device",
                    //           style: AppTextStyles.reportForm),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              );
            }),
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
