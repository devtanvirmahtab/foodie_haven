import 'package:get/get.dart';

import '../../core/constants/asset_constant.dart';
import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  final String image = logoPng;
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.LOGIN);
    });
    super.onInit();
  }

}
