import 'package:foodie_haven/app/data/model/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  String title = '';
  ProductModel product = ProductModel();

  @override
  void onInit() {
    final argument = Get.arguments;
    if(argument != null){
      product = argument['product'];
      title = product.title ?? '';
    }
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
