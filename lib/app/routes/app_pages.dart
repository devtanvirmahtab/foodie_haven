import 'package:get/get.dart';

import '../modules/auth/forget/forget_binding.dart';
import '../modules/auth/forget/forget_view.dart';
import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/otp_verify/otp_verify_binding.dart';
import '../modules/auth/otp_verify/otp_verify_view.dart';
import '../modules/auth/sign_up/sign_up_binding.dart';
import '../modules/auth/sign_up/sign_up_view.dart';
import '../modules/bottom_nav/home/home_binding.dart';
import '../modules/bottom_nav/home/home_view.dart';
import '../modules/bottom_nav/main_nav/main_nav_binding.dart';
import '../modules/bottom_nav/main_nav/main_nav_view.dart';
import '../modules/bottom_nav/profile/profile_binding.dart';
import '../modules/bottom_nav/profile/profile_view.dart';
import '../modules/product_details/product_details_binding.dart';
import '../modules/product_details/product_details_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_NAV,
      page: () => const MainNavView(),
      binding: MainNavBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.FORGET,
      page: () => const ForgetView(),
      binding: ForgetBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => const OtpVerifyView(),
      binding: OtpVerifyBinding(),
    ),
  ];
}
