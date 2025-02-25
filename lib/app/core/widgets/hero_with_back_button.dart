import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class HeroWithBackButton extends StatelessWidget {
  final String image;
  final double top;

  const HeroWithBackButton({
    super.key,
    required this.image,
    this.top = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          alignment: Alignment.topCenter,
        ),
        Positioned(
          top: top,
          child: Material(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              borderRadius: BorderRadius.circular(12),
              child: Ink(
                padding: mainPadding(15, 15),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
