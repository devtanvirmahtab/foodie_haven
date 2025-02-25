import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';

class AppOutlineButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final VoidCallback onPressed;

  const AppOutlineButton({
    super.key,
    required this.text,
    this.borderRadius = 30,
    this.borderWidth = 1,
    this.borderColor = AppColor.primaryColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        overlayColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: Text(
        text,
        style: text14Style(isWeight600: true).copyWith(color: borderColor),
      ),
    );
  }
}
