import 'package:flutter/material.dart';
import 'package:ggram_online/Theme/app_color.dart';

class InnerShadowButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const InnerShadowButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 52,
  });

  @override
  Widget build(BuildContext context) {
    const backgroundColor = AppColor.buttonColor;
    const innerShadowColor = Color.fromRGBO(0, 0, 0, 0.12);

    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Main Button Background
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
            // Simulated Inner Shadow
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height / 2),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    innerShadowColor,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.4],
                ),
              ),
            ),
            // Text
            Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  // letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
