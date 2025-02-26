import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/widgets/app_default/app_app_bar.dart';
import '../../../core/widgets/app_default/app_button.dart';
import 'otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: text18Style(),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColor.primaryColor),
      borderRadius: BorderRadius.circular(15),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColor.white,
      ),
    );

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppAppBar(
        title: 'ভেরিফিকেশন',
      ),
      body: Padding(
        padding: mainPadding(20, 20),
        child: Column(
          children: [
            gapH32,
            Text(
              '+৮৮০০১৭৫৫৫৫৫৫৫৫ ',
              style: text18Style(),
              textAlign: TextAlign.center,
            ),
            Text(
              'উক্ত নাম্বারে ওটিপি পাঠানো হয়েছে ',
              style: text14Style(),
              textAlign: TextAlign.center,
            ),
            gapH32,
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
              controller: controller.otpController,
            ),
            gapH16,
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(() {
                return AppButton(
                  text: "ওটিপি যাচাই করুন",
                  isLoading: controller.isLoading.value,
                  onPressed: controller.otpVerifyClickHandler,
                );
              }),
            ),
            gapH12,
          ],
        ),
      ),
    );
  }
}
