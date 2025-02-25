import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_style.dart';
import '../constants/app_text_style.dart';
import 'app_default/app_button.dart';

class AppWidgets {
  Widget gapH(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget gapW4() {
    return const SizedBox(
      width: 4,
    );
  }

  Widget gapW8() {
    return const SizedBox(
      width: 8,
    );
  }

  Widget gapH8() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget gapH16() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget gapH20() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget gapW16() {
    return const SizedBox(
      width: 16,
    );
  }

  Widget gapW12() {
    return const SizedBox(
      width: 12,
    );
  }

  Widget gapH12() {
    return const SizedBox(
      height: 12,
    );
  }

  Widget gapW24() {
    return const SizedBox(
      width: 24,
    );
  }

  Widget gapH24() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget gapW30() {
    return const SizedBox(
      width: 30,
    );
  }

  Widget gapH30() {
    return const SizedBox(
      height: 30,
    );
  }

  SnackbarController getSnackBar({
    title = "Title",
    message = " Some message",
    int waitingTime = 2,
    int animationDuration = 500,
    snackPosition = SnackPosition.TOP,
    Color backgroundColor = AppColor.primaryColor,
    double backgroundColorOpacity = .7,
    colorText = AppColor.white,
  }) {
    return Get.snackbar(title, message,
        snackPosition: snackPosition,
        duration: Duration(seconds: waitingTime),
        animationDuration: Duration(milliseconds: animationDuration),
        backgroundColor: backgroundColor.withValues(alpha: backgroundColorOpacity),
        colorText: colorText);
  }

  RoundedRectangleBorder myButtonMaterialStateShape(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius));
    }
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius));
  }

  double myButtonMaterialStateElevation(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return 3;
    }
    return 3;
  }

  double myButtonMaterialStateElevationForTransparent(
      Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return 3;
    }
    return 0;
  }

  Color myButtonMaterialStateBlueColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.textColorBlue.withValues(alpha: .6);
    }
    return AppColor.textColorBlue;
  }

  Color myButtonMaterialStateColorTransparent(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.primaryColor.withValues(alpha: 0.7);
    }
    return AppColor.primaryColor.withValues(alpha: 0.7);
  }

  Color myButtonMaterialStateColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColor.primaryColor;
    }
    return AppColor.primaryColor;
  }


  Widget changeLanguage({
    bool fullName = false,
  }) {
    String locale = Get.locale?.languageCode ?? "en";
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.updateLocale(const Locale("en"));
            locale = "en";
            // myHelper.saveLocale("en");
          },
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: locale == "en" ? AppColor.primaryColor : null,
              border: Border.all(
                color: AppColor.primaryColor,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Center(
                child: Text(
                  fullName ? "English" : "EN",
                  style: locale == "en"
                      ? text14Style(isWhiteColor: true)
                      : text14Style(isPrimaryColor: true),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.updateLocale(const Locale("bn"));
            locale = "bn";
            // myHelper.saveLocale("bn");
          },
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: locale == "bn" ? AppColor.primaryColor : null,
              border: Border.all(
                color: AppColor.primaryColor,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 12),
              child: Center(
                child: Text(
                  fullName ? "বাংলা" : "বাং",
                  style: locale == "bn"
                      ? text14Style(isWhiteColor: true)
                      : text14Style(isPrimaryColor: true),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  showSimpleDialog(
    String title,
    String body,
    retryClick, {
    buttonText = "Try Again",
    barrierDismissible = true,
  }) {
    if (Get.context == null) {
      return null;
    }
    /*return Get.defaultDialog(
      title: title,
      middleText: body,
      backgroundColor: Colors.white,
      titleStyle: textAppBarStyle(),
      middleTextStyle: textRegularStyle(),
      radius: borderRadius,
    );*/
    return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          // style: textAppBarStyle(),
        ),
        content: Text(
          body,
          // style: textRegularStyle(),
        ),
        /*insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.only(
          left: mainPaddingW,
          right: mainPaddingW,
          top: mainPaddingH,
        ),
        contentPadding: EdgeInsets.only(
          left: mainPaddingW,
          right: mainPaddingW,
        ),*/
        actions: <Widget>[
          TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.pop(context);
                if (buttonText != "Ok") {
                  try {
                    retryClick();
                    // AppHelper().showLoader();
                  } catch (e) {
                    // AppHelper().hideLoader();
                  }
                }
              })
        ],
      ),
    );
  }

  myAppBar(title, {List<Widget>? action}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColor.blackPure,
          size: 25,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: textAppBarStyle(fontSize: 20),
      ),
      centerTitle: true,
      actions: action ?? [],
    );
  }

  showSimpleToast(
    String? message, {
    String? title,
    bool isShort = false,
    bool isSuccess = false,
    bool isInfo = false,
    bool isError = true,
  }) {
    Get.snackbar(
      title ??
          (isSuccess
              ? "Success"
              : isInfo
                  ? "Info"
                  : "Error"),
      message ?? "",
      icon: Icon(
        (isSuccess
            ? Icons.check_circle
            : isInfo
                ? Icons.info
                : Icons.error),
        color: AppColor.white,
      ),
      shouldIconPulse: true,
      // barBlur: 20,
      // overlayBlur: 1,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      backgroundColor: (isSuccess
          ? AppColor.successColor.withValues(alpha: .8)
          : isInfo
              ? AppColor.infoColor.withValues(alpha: .8)
              : AppColor.errorColor.withValues(alpha: .8)),
      margin: EdgeInsets.only(
        top: mainPaddingH,
        left: mainPaddingW,
        right: mainPaddingW,
      ),
      colorText: AppColor.white,
      duration: const Duration(seconds: 3),
    );
    /*showTopSnackBar(
        Overlay.of(Get.context ?? context),
        isSuccess
            ? CustomSnackBar.success(message: msg!)
            : isInfo
            ? CustomSnackBar.info(message: msg!)
            : isError
            ? CustomSnackBar.error(message: msg!)
            : CustomSnackBar.error(message: msg!),
        displayDuration: Duration(seconds: isShort ? 1 : 2));*/
  }

  Widget noData({color = Colors.redAccent}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: mainPaddingH,
          horizontal: mainPaddingW,
        ),
        child: Text(
          "No Data Found",
          style: text20Style(
            fontWeight: FontWeight.w600,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  //Need to remove this from there
  cardTiles({leadingTitle, leadingValue, trailingTitle, trailingValue}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leadingTitle,
                    style: textRegularStyle(
                      isColorPrimary: true,
                    ),
                  ),
                  Text(
                    leadingValue,
                    style: textRegularStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    trailingTitle,
                    style: textRegularStyle(
                      isColorPrimary: true,
                    ),
                  ),
                  Text(
                    trailingValue,
                    style: textRegularStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        gapH(4),
      ],
    );
  }

  showAppDialog({
    headTitle = "অভিনন্দন!",
    bodyTitle = "",
    assetString = "dialoguePopUpImage",
    buttonText = "Try Again",
    barrierDismissible = true,
  }) {
    if (Get.context == null) {
      return null;
    }
    return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        title: null,
        content: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                assetString,
                height: 180,
                width: 180,
              ),
              gapH24(),
              Text(
                headTitle,
                textAlign: TextAlign.center,
                style: textRegularStyle(
                  fontSize: 24,
                  isColorPrimary: true,
                ),
              ),
              gapH12(),
              Text(
                bodyTitle,
                textAlign: TextAlign.center,
                style: textRegularStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // readMoreText(text, {trimLines = 3}) {
  //   return ReadMoreText(
  //     text,
  //     trimLines: trimLines,
  //     colorClickableText: AppColor.blackPure,
  //     trimMode: TrimMode.ClipWordEllipse,
  //     trimCollapsedText: seeMore.tr,
  //     trimExpandedText: showLess.tr,
  //     moreStyle: textHeaderStyle(
  //       fontSize: fontSize14,
  //       lineHeight: 1.2,
  //       // fontWeight: FontWeight.w600,
  //     ),
  //     lessStyle: textHeaderStyle(
  //       fontSize: fontSize14,
  //       lineHeight: 1.2,
  //       // fontWeight: FontWeight.w600,
  //     ),
  //     preDataTextStyle: textRegularStyle(
  //       fontSize: fontSize14,
  //     ),
  //     style: textRegularStyle(
  //       fontSize: fontSize14,
  //       lineHeight: 1.2,
  //     ),
  //     callback: (val) {},
  //   );
  // }

  sloganTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Slogan Title",
        style: text20Style(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 32),
        children: <TextSpan>[
          TextSpan(
            text: '?',
            style: text20Style(color: AppColor.black, fontSize: 3),
          ),
        ],
      ),
    );
  }

  //Todo Bottom Sheet will change next:
  myBottomSheet(context, child,
      {double heightRatio = 0.55, bool isDismissible = false}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isDismissible: isDismissible,

      // scrollControlDisabledMaxHeightRatio: heightRatio,
      // constraints: BoxConstraints(
      //   minHeight: 200,
      //   maxHeight: height
      // ),
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              // padding: EdgeInsets.all(12),
              padding: const EdgeInsets.only(
                top: 12,
                left: 16,
                right: 16,
              ),
              height: Get.height * heightRatio,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }

  appDivider(
      {color = AppColor.white,
      isColorBlack = false,
      double thickness = 1,
      double height = 20}) {
    return Divider(
      height: height,
      thickness: thickness,
      color: isColorBlack ? AppColor.black.withValues(alpha: 0.5) : color,
    );
  }

  // Future<void> downloadPdf(Uri uri) async {
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw "Could not launch $uri";
  //   }
  // }

  showStatusDialog({
    required headTitle,
    barrierDismissible = true,
    required VoidCallback yesTap,
    required VoidCallback noTap,
  }) {
    if (Get.context == null) {
      return null;
    }
    return showDialog(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: null,
        content: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapH24(),
              Text(
                headTitle,
                textAlign: TextAlign.center,
                style: textRegularStyle(
                  fontSize: 24,
                ),
              ),
              gapH16(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Yes',
                      onPressed: yesTap,
                      backgroundColor: AppColor.red,
                    ),
                  ),
                  gapW12(),
                  Expanded(
                    child: AppButton(
                      text: 'No',
                      onPressed: noTap,
                      backgroundColor: AppColor.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // showSimpleDialogs(context, Function()? onTap) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(
  //         confirmationTr.tr,
  //         style: text14Style(fontSize: 16),
  //       ),
  //       content: Text(
  //         deleteMsgTr.tr,
  //         style: text12Style(
  //           fontSize: 14,
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Get.back(),
  //           child: Text(
  //             noTr.tr,
  //             style: text12Style(
  //               color: MyColors.red,
  //             ),
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: onTap,
  //           child: Text(
  //             yesTr.tr,
  //             style: text12Style(
  //               color: MyColors.black,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  String naming(String name, String nameEn) {
    if (Get.locale?.languageCode == "bn") {
      if (name != "") {
        return name;
      } else {
        return name;
      }
    } else {
      if (nameEn != "") {
        return nameEn;
      } else {
        return name;
      }
    }
  }

// void launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// noInternetDialog() {
//   return showDialog(
//       context: Get.context!,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             noInternetMsg.tr,
//             textAlign: TextAlign.center,
//             style: text18Style(fontSize: 24),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Lottie.asset(
//                 'assets/lottie/no_internet.json',
//                 // Replace with your Lottie animation file path
//                 width: 200,
//                 height: 200,
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 checkInternetConnectionMsg.tr,
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         );
//       });
// }
}
