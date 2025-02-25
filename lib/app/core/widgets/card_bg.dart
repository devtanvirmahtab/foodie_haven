import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class CardBg extends StatelessWidget {
  final Widget child;

  const CardBg({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: mainPadding(20, 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
