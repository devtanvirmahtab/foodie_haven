import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/widgets/app_default/app_app_bar.dart';
import '../../../core/widgets/app_default/app_button.dart';
import '../../../core/widgets/app_default/app_edit_text.dart';
import '../../../routes/app_pages.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppAppBar(
        title: 'Login',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: mainPadding(20, 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                gapH16,
                Text(
                  'সাইন ইন করুন',
                  style: text20Style(),
                ),
                gapH12,
                AppEditText(
                  title: 'ইমেইল প্রদান করুন',
                  controller: controller.phoneController,
                  errorMsg: 'আপনার ইমেইল প্রদান অবশ্যই দিতে হবে',
                  isEmail: true,
                  nextFocus: controller.passwordFocusNode,
                ),
                Obx(() {
                  return AppEditText(
                    title: 'পাসওয়ার্ড প্রদান করুন',
                    errorMsg: 'আপনার পাসওয়ার্ড অবশ্যই দিতে হবে',
                    controller: controller.passwordController,
                    isPassword: true,
                    needToShowEye: true,
                    isShowEye: controller.isShowPassword.value,
                    focusNode: controller.passwordFocusNode,
                    eyeClick: () {
                      controller.isShowPassword.value =
                      !controller.isShowPassword.value;
                    },
                  );
                }),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.FORGET);
                    },
                    child: Text(
                      'পাসওয়ার্ড ভুলে গেছেন?',
                      style: text14Style(
                        color: AppColor.greyTextColor,
                      ),
                    ),
                  ),
                ),
                gapH12,
                Obx(() {
                  return AppButton(
                    text: "লগইন",
                    onPressed: controller.loginButtonClickHandler,
                    isLoading: controller.isLoading.value,
                  );
                }),
                gapH12,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'একাউন্ট নেই?',
                      style: text14Style(
                        color: AppColor.greyTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SIGN_UP);
                      },
                      child: Text(
                        'রেজিস্ট্রেশন করুন',
                        style: TextStyle(
                          color: AppColor.greyBlueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
