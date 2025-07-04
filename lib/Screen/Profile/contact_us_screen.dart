import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Screen/profile/profile_controller/contact_us_controller.dart';
import 'package:ggram_online/Widgets/common_button.dart';
import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/common_textfield.dart';
import '../../Widgets/common_appbar.dart';
import '../../Widgets/custom_popup.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        appBar: const CommonAppBar(
          title: "Contact Us",
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 53),
          child: InnerShadowButton(
            text: "Submit",
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => CustomCommonPopup(
                  title: "Thank You",
                  subtitle: "Thank you! We will get back to you soon!",
                  onContinue: () {
                    Get.offAllNamed(RouteName.bottomNavBar);
                  },
                  showButton: true,
                  buttonText: "Okay",
                ),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildBody()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Topic", style: AppTextStyles.reportForm),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColor.textFiledBackground,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButtonFormField<String>(
            value: controller.selectedTopic.value.isNotEmpty ? controller.selectedTopic.value : null,
            decoration: const InputDecoration(border: InputBorder.none),
            icon: Padding(
              padding: const EdgeInsets.all(2),
              child: Image.asset("assets/icons/Vector.png"),
            ),
            hint: const Text("Select", style: AppTextStyles.selectHintText),
            borderRadius: BorderRadius.circular(20),
            dropdownColor: AppColor.backgroundContainer,
            items: controller.topicList.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (newValue) => controller.selectedTopic.value = newValue ?? '',
          ),
        ),
        const SizedBox(height: 20),
        const TextFieldView(
          title: "Subject",
          hintText: "Please enter your subject",
        ),
        const SizedBox(height: 20),
        const TextFieldView(
          title: "Message",
          hintText: "Add details...",
          maxLines: 5,
          minLines: 5,
        ),
      ],
    );
  }
}
