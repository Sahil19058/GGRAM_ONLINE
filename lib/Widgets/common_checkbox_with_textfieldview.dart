import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:get/get.dart';

import '../Theme/app_color.dart';

class CommonCheckboxWithTextFieldView extends StatelessWidget {
  final String label;
  final RxBool value;
  final Function(bool?) onChanged;
  final TextEditingController controller;
  final String hintText;
  final Color? boxShadowColor;

  const CommonCheckboxWithTextFieldView({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.controller,
    required this.hintText,
    this.boxShadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                scale: 1.3,
                child: Checkbox(
                  value: value.value,
                  onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: const BorderSide(color: AppColor.outlineBorder),
                  activeColor: AppColor.buttonColor,
                  materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Divider(color: Colors.grey.shade300, thickness: 1),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
              color: AppColor.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: "Inter",
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            maxLines: 3,
            minLines: 3,
          ),
        ],
      ),
    ));
  }
}
