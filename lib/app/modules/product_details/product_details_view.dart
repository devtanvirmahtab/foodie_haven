import 'package:flutter/material.dart';
import 'package:foodie_haven/app/core/constants/app_constants.dart';
import 'package:foodie_haven/app/core/constants/app_text_style.dart';
import 'package:foodie_haven/app/core/widgets/app_default/app_app_bar.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_default/app_button.dart';
import 'product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppAppBar(title: controller.title),
      body: Padding(
        padding: mainPadding(20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH16,
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(controller.product.image ?? ''),
            ),
            gapH16,
            Row(
              children: [
                Text(
                  'Price : ',
                  style: text16Style(isWeight600: true),
                ),
                Text(
                  '\$${controller.product.price}',
                  style: text16Style(isWeight600: true),
                ),
              ],
            ),
            gapH8,
            Text(
              controller.product.title ?? '',
              style: text20Style(),
            ),
            gapH8,
            Text(
              controller.product.description ?? '',
              style: text14Style(),
            ),
            Spacer(),
            AppButton(
              text: 'Add to Cart',
              onPressed: () {},
              backgroundColor: AppColor.red,
            ),
            gapH8,
          ],
        ),
      ),
    );
  }
}
