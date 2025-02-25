import 'package:foodie_haven/app/core/constants/app_colors.dart';
import 'package:foodie_haven/app/core/constants/asset_constant.dart';
import 'package:get/get.dart';

import '../../../data/model/product_model.dart';

class HomeController extends GetxController {
  final categoriesList = [
    {
      'name': 'Burger',
      'img': burgerPng,
    },
    {
      'name': 'Pizza',
      'img': pizzaPng,
    },
    {
      'name': 'Meals',
      'img': ramenPng,
    },
    {
      'name': 'Snacks',
      'img': frenchFriesPng,
    },
    {
      'name': 'Juich',
      'img': sodaPng,
    },
    {
      'name': 'Donut',
      'img': donutPng,
    },
    {
      'name': 'Burger',
      'img': burgerPng,
    },
  ];

  final popularItem = [
    ProductModel(
      title: 'Chicken Burger',
      description: 'Chicken Burger with chilli and cheese',
      foodType: 'Fast Food',
      rating: '4.7',
      price: '15.00',
      image: chickenBurger,
      totalRating: '120',
    ),
    ProductModel(
      title: 'Cheese Pizza',
      description: 'Mized Pizza with beef, chilli and cheese',
      foodType: 'Fast Food',
      rating: '4.8',
      price: '19.00',
      image: cheesePizza,
      totalRating: '300',
    ),
    ProductModel(
      title: 'Chicken Burger',
      description: 'Chicken Burger with chilli and cheese',
      foodType: 'Fast Food',
      rating: '4.6',
      price: '14.00',
      image: chickenBurger,
      totalRating: '900',
    ),
    ProductModel(
      title: 'Cheese Pizza',
      description: 'Chicken Burger with chilli and cheese',
      foodType: 'Fast Food',
      rating: '4.9',
      price: '20.00',
      image: cheesePizza,
      totalRating: '100',
    ),
    ProductModel(
      title: 'Cheese Burger',
      description: 'Chicken Burger with chilli and cheese',
      foodType: 'Fast Food',
      rating: '4.7',
      price: '15.00',
      image: chickenBurger,
      totalRating: '200',
    ),
    ProductModel(
      title: 'Chicken Burger',
      description: 'Chicken Burger with chilli and cheese',
      foodType: 'Fast Food',
      rating: '4.7',
      price: '15.00',
      image: cheesePizza,
      totalRating: '500',
    ),
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
