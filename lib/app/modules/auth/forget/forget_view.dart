import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/widgets/app_default/app_app_bar.dart';
import '../../../core/widgets/app_default/app_button.dart';
import '../../../core/widgets/app_default/app_edit_text.dart';
import 'forget_controller.dart';

class ForgetView extends GetView<ForgetController> {
  const ForgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppAppBar(
        title: 'পাসওয়্যার্ড পূণরুদ্ধার',
      ),
      body: Padding(
        padding: mainPadding(20, 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Text(
                'পাসওয়্যার্ড পূণরুদ্ধার',
                style: text20Style(),
              ),
              gapH16,
              AppEditText(
                title: 'ইমেইল প্রদান করুন',
                controller: controller.phoneController,
                isEmail: true,
                errorMsg: 'আপনার ইমেইল  অবশ্যই দিতে হবে',
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Obx(() {
                  return AppButton(
                    text: "ওটিপি পাঠান",
                    isLoading: controller.isLoading.value,
                    onPressed: controller.otpVerifyClickHandler,
                  );
                }),
              ),
              gapH12,
            ],
          ),
        ),
      ),
    );
  }
}
