import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignUpController extends GetxController {
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
        Get.offAllNamed(
          Routes.OTP_VERIFY,
          arguments: {
            "signup": true,
          },
        );
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
