import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController {
  final otpController = TextEditingController();
  final isLoading = false.obs;
  bool isSignup = false;
  bool isNumberChange = false;
  bool isEmailChange = false;
  String title = '';

  @override
  void onInit() {
    final argument = Get.arguments;
    if(argument != null){
      if(argument['signup'] != null){
        isSignup = argument['signup'];
      }else if(argument['change_number'] != null){
        isNumberChange = argument['change_number'];
      }else if(argument['change_email'] != null){
        isEmailChange = argument['change_email'];
      }

    }
    super.onInit();
  }

  void otpVerifyClickHandler(){
    isLoading.value = true;
    Future.delayed(Duration(seconds: 2),(){
      isLoading.value = false;
      if(isSignup){
        //   Get.toNamed(Routes.CONGRATULATIONS);
        // }else if(isNumberChange){
        //   Get.toNamed(Routes.CHANGE_NUMBER);
        // }else if(isEmailChange){
        //   Get.toNamed(Routes.CHANGE_EMAIL);
        // }else{
        //   Get.toNamed(Routes.NEW_PASSWORD);
      }
    });
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

}
