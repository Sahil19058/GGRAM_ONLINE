import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:get/get.dart';

import '../Theme/app_color.dart';


class CommonCheckboxView extends StatelessWidget {
  final String label;
  final RxBool value;
  final Function(bool?) onChanged;
  final Color? boxShadowColor;

  const CommonCheckboxView({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.boxShadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -4),
            blurRadius: 10,
            spreadRadius: 0,
            color: boxShadowColor ?? Colors.grey.shade300,
            inset: true,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label.tr,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
                color: AppColor.textPrimary,
              ),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: value.value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: const BorderSide(color: AppColor.outlineBorder),
              activeColor: AppColor.buttonColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          ),
        ],
      ),
    ));
  }
}
