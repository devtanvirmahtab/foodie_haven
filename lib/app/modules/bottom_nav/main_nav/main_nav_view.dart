import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asset_constant.dart';
import 'main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.pageList[controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          elevation: 1,
          backgroundColor: AppColor.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.greyTextColor,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: menuItemIcon(
                selected: controller.selectedIndex.value == 0,
                icon: homeIcon,
              ),
              label: 'হোম',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'প্রোফাইল',
            ),
          ],
        );
      }),
    );
  }

  Widget menuItemIcon({bool selected = false, required String icon}) {
    return Image.asset(
      icon,
      width: 24,
      color: selected ? AppColor.primaryColor : AppColor.greyTextColor,
    );
  }
}
