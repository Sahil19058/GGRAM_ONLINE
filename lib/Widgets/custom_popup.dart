import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Theme/app_color.dart';
import '../../Theme/app_textstyle.dart';
import 'common_button.dart';

class CustomCommonPopup extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onContinue;
  final bool showButton;
  final String buttonText;
  final Widget? body;
  final String? imagePath;

  const CustomCommonPopup({
    super.key,
    required this.title,
    required this.subtitle,
    this.onContinue,
    this.showButton = true,
    this.buttonText = "Continue",
    this.body,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: Get.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 42),
                decoration: BoxDecoration(
                  color: AppColor.backgroundContainer,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontFamily: 'Raleway',
                        color: AppColor.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      style: AppTextStyles.loginSubTitle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    if (body != null) ...[
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: body ?? SizedBox(),
                      ),
                    ],
                    if (showButton && onContinue != null)
                      const SizedBox(height: 24),
                    if (body == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: InnerShadowButton(
                          text: buttonText,
                          onPressed: onContinue ?? () {},
                        ),
                      ),
                    if (showButton) const SizedBox(height: 20),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 85,
                    width: 85,
                    decoration: const BoxDecoration(
                      color: AppColor.popupBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        imagePath ?? "assets/image/thumbs-up.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
