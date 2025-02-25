import 'package:flutter/material.dart';
import 'package:foodie_haven/app/core/constants/app_colors.dart';
import 'package:foodie_haven/app/core/constants/app_constants.dart';
import 'package:foodie_haven/app/core/constants/app_text_style.dart';
import 'package:foodie_haven/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/constants/asset_constant.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: mainPadding(20, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    burgerBannerPng,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              gapH16,
              Padding(
                padding: mainPadding(20, 5),
                child: Text(
                  'Categories',
                  style: text18Style(),
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  padding: mainPadding(20, 10),
                  itemCount: controller.categoriesList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = controller.categoriesList[index];
                    return Column(
                      children: [
                        Image.asset(
                          data['img']!,
                          height: 60,
                          width: 60,
                        ),
                        gapH8,
                        Text(
                          data['name']!,
                          style: text14Style(isWeight500: true),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return gapW16;
                  },
                ),
              ),
              gapH16,
              Padding(
                padding: mainPadding(20, 5),
                child: Text(
                  'Popular ',
                  style: text18Style(),
                ),
              ),
              SizedBox(
                height: 275,
                child: ListView.separated(
                  padding: mainPadding(20, 10),
                  itemCount: controller.popularItem.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final data = controller.popularItem[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.PRODUCT_DETAILS,
                          arguments: {
                            'product': data,
                          },
                        );
                      },
                      child: Ink(
                        width: 280,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.liteGray,
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                data.image ?? '',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            gapH16,
                            Row(
                              children: [
                                gapW12,
                                Text(
                                  data.title ?? '',
                                  style: text18Style(),
                                )
                              ],
                            ),
                            Padding(
                              padding: mainPadding(12, 0),
                              child: Text(
                                data.foodType ?? '',
                                style: text14Style(isWeight600: true),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    gapW12,
                                    Icon(Icons.star),
                                    gapW3,
                                    Text(data.rating ?? ''),
                                    gapW3,
                                    Text(
                                      '(${data.totalRating} Ratings)',
                                      style: text14Style(),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  padding: mainPadding(10, 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: AppColor.red,
                                  ),
                                  child: Text(
                                    '\$${data.price}',
                                    style: text16Style(isWhiteColor: true),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return gapW20;
                  },
                ),
              ),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
