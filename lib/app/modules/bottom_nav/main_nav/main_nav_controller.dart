import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import '../profile/profile_view.dart';

class MainNavController extends GetxController {
  final selectedIndex = 0.obs;
  final pageList = <Widget>[
    HomeView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
