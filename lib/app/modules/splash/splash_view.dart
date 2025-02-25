import 'package:flutter/material.dart';
import 'package:foodie_haven/app/core/constants/app_colors.dart';

import 'package:get/get.dart';

import '../../core/constants/asset_constant.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(controller.image,),
      ),
    );
  }
}
