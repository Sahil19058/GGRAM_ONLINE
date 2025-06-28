import 'package:flutter/material.dart';
import 'package:ggram_online/Theme/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ggram_online/Theme/app_textstyle.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onTap;


  const CommonAppBar({
    super.key,
    required this.title,
    this.centerTitle,
    this.leading,
    this.actions,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
      ),
      child: AppBar(
        title: Text(title),
        titleTextStyle: AppTextStyles.splashSubTitle,
        actions:actions,
        centerTitle: centerTitle,
        scrolledUnderElevation: 0,
        leading: leading ?? (Padding(
          padding: const EdgeInsets.only(left: 30),
          child: InkWell(
            onTap: onTap ?? () => Navigator.of(context).pop(),
            child: Container(child: SvgPicture.asset("assets/icons/back.svg")),
          ),
        )
        ),
        foregroundColor: AppColor.textSecondary,
        backgroundColor: AppColor.backgroundContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
