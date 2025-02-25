import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isCenterTitle;
  final Color backgroundColor;
  final List<Widget>? actions;
  final bool isBack;

  const AppAppBar({
    super.key,
    required this.title,
    this.isCenterTitle = true,
    this.backgroundColor = AppColor.primaryColor,
    this.actions,
    this.isBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBack ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.white,
          ),
        ),
      ) : null,
      title: Text(
        title,
        style: text16Style(
          isWhiteColor: true,
          fontSize: 20,
        ),
      ),
      backgroundColor: backgroundColor,
      centerTitle: isCenterTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
