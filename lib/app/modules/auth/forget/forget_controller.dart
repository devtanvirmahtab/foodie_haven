import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ForgetController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void otpVerifyClickHandler() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      Future.delayed(Duration(seconds: 3), () {
        isLoading.value = false;
        Get.toNamed(Routes.OTP_VERIFY);
      });
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
