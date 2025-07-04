
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggram_online/Screen/home/home_controller/home_controller.dart';
import 'package:ggram_online/Theme/app_color.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({
    super.key,
  });

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
    );
  }

}


