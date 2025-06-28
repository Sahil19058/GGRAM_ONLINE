import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/Splesh/splash_controller.dart';

import '../../Theme/app_textstyle.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/image/Splash.png",
            fit: BoxFit.fill,
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.only(top:125),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo/Icon
                Image.asset(
                  "assets/image/Splash_location.png",
                  width: 99,
                  height: 156,
                ),
                // Welcome Text
                const Text(
                  'Welcome!',
                  style: AppTextStyles.splashTitle,
                ),
                const SizedBox(height: 12),
                // Tagline
                const Text(
                  'Thanks For Taking Care Of Our City',
                  style: AppTextStyles.splashSubTitle
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
