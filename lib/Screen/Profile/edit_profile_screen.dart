import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/profile/profile_controller/edit_profile_controller.dart';
import 'package:ggram_online/Widgets/common_appbar.dart';
import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/common_textfield.dart';
import '../../utils/form_validators.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

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
            title: "Edit Profile",
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [_buildBody()],
              ),
            ),
          )),
    );
  }

  Widget _buildBody() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Obx(() => Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColor.outlineBorder,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      // fit: BoxFit.cover,
                      image: controller.profileImage.value != null
                          ? FileImage(controller.profileImage.value!)
                          : const AssetImage('assets/image/user.png') as ImageProvider,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: controller.pickImageFromGallery,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.buttonColor,
                        image: DecorationImage(
                          image: AssetImage("assets/image/camera.png"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
          const SizedBox(height: 25),
          TextFieldView(
            title: "Name",
            controller: controller.nameController,
            hintText: 'Please enter your name',
            validator: FormValidators.validateName,
          ),
          const SizedBox(height: 10),
          TextFieldView(
            title: "Email ID",
            controller: controller.emailController,
            hintText: 'Please enter your email ID',
            validator: FormValidators.validateEmail,
          ),
          const SizedBox(height: 10),
          TextFieldView(
              title: "Age",
              controller: controller.ageController,
              hintText: 'Please enter your age',
              keyBoardType: TextInputType.number,
              validator: FormValidators.validateAge),
          const SizedBox(height: 10),
          TextFieldView(
            title: "Home PIN",
            controller: controller.homePinController,
            hintText: 'Please enter your home PIN',
            keyBoardType: TextInputType.number,
            validator: FormValidators.validatePin,
          ),
          const SizedBox(height: 10),
          const Text("Gender", style: AppTextStyles.reportForm),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColor.textFiledBackground,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: DropdownButtonFormField<String>(
              value: controller.selectedGender.value.isNotEmpty
                  ? controller.selectedGender.value
                  : null,
              decoration: const InputDecoration(border: InputBorder.none),
              borderRadius: BorderRadius.circular(20),
              dropdownColor: AppColor.backgroundContainer,
              icon: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset("assets/icons/Vector.png"),
              ),
              hint: const Text("Select",
                  style: TextStyle(
                      color: AppColor.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
              validator: FormValidators.validateGender,
              items: controller.genderOptions.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) =>
                  controller.selectedGender.value = newValue ?? '',
            ),
          ),
          const SizedBox(height: 24),
          const Text("Share more details to Help us improve.",
              style: AppTextStyles.splashSubTitle),
          const SizedBox(height: 24),
          const Text("Residential Status", style: AppTextStyles.reportForm),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColor.textFiledBackground,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: DropdownButtonFormField<String>(
              value: controller.selectedStatus.value.isNotEmpty
                  ? controller.selectedStatus.value
                  : null,
              decoration: const InputDecoration(border: InputBorder.none),
              borderRadius: BorderRadius.circular(20),
              dropdownColor: AppColor.backgroundContainer,
              icon: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.asset("assets/icons/Vector.png"),
              ),
              hint: const Text("Select",
                  style: TextStyle(
                      color: AppColor.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
              validator: FormValidators.validateStatus,
              items: controller.statusOptions.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) =>
                  controller.selectedStatus.value = newValue ?? '',
            ),
          ),
          const SizedBox(height: 20),
          TextFieldView(
            title: "Originally From",
            controller: controller.originController,
            hintText: 'Please enter where you are from originally',
          ),
          const SizedBox(height: 20),
          TextFieldView(
            title: "Occupation",
            controller: controller.occupationController,
            hintText: 'Please enter your Occupation',
          ),
          const SizedBox(height: 20),
          TextFieldView(
            title: "Household",
            controller: controller.householdController,
            hintText: 'Please enter your household',
          ),
          const SizedBox(height: 20),
          TextFieldView(
            title: "Household Income",
            controller: controller.incomeController,
            hintText: 'Please enter your Household Income',
            keyBoardType: TextInputType.number,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InnerShadowButton(
              text: "Submit",
              onPressed: () {
                Get.back();
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
