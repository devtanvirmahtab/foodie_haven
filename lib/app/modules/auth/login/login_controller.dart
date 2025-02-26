import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final isShowPassword = true.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void loginButtonClickHandler() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      Future.delayed(Duration(seconds: 3),(){
        isLoading.value = false;
        Get.offAllNamed(Routes.MAIN_NAV);
      });
      // loginApi();
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
