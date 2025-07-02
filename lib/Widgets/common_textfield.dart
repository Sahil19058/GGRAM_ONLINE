import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:get/get.dart';

import '../Theme/app_color.dart';

class TextFieldView extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyBoardType;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final String? counterText;

  const TextFieldView({
    super.key,
    this.title,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onTap,
    this.keyBoardType,
    this.minLines,
    this.maxLines,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.maxLength,
    this.counterText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!.tr,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
              color: AppColor.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          height: minLines == null ? 48 : null,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColor.outlineBorder,
              width: 1,
            ),
          ),
          child: TextFormField(
            maxLength: maxLength,
            controller: controller,
            onTap: onTap,
            obscureText: obscureText,
            validator: validator,
            minLines: minLines,
            maxLines: maxLines,
            keyboardType: keyBoardType,
            onChanged: onChanged,
            autofocus: false,
            readOnly: readOnly,
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: AppColor.textSecondary,
            ),
            decoration: InputDecoration(
              counterText: counterText ?? null,
              hintText: hintText.tr,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColor.outlineBorder,
                overflow: TextOverflow.ellipsis,

              ),
              filled: true,
              fillColor: AppColor.textFiledBackground,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColor.outlineBorder,
                  width: 0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
