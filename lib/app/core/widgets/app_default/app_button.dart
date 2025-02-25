import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColor.primaryColor,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w700,
    this.borderRadius = 50.0,
    this.gapSize = 5.0,
    this.borderWidth = 1.5,
    this.assetImageWidth = 50.0,
    this.iconSize = 50.0,
    this.textLineHeight = 1.1,
    this.maxTextLines = 1,
    this.textLetterSpacing = .6,
    this.textColor = AppColor.white,
    this.iconColor = AppColor.white,
    this.isTextPrimaryColor = false,
    this.isTextDefaultGradientColor = false,
    this.isFontNormal = false,
    this.isTextNormalLineHeight = false,
    this.isTextNormalLineSpacing = false,
    this.isEmptyBackGroundWithPrimaryColor = false,
    this.needVerticalPadding = true,
    this.needGradient = false,
    this.needAssetImage = false,
    this.assetImage = "",
    this.needIcon = false,
    this.textAlign = TextAlign.center,
    this.icon,
    this.needRightAssetImage = false,
    this.isLoading = false,
  });

  final IconData? icon;
  final String text, assetImage;
  final double textLetterSpacing,
      textLineHeight,
      fontSize,
      borderRadius,
      borderWidth,
      assetImageWidth,
      iconSize,
      gapSize;
  final bool isTextNormalLineSpacing,
      isLoading,
      isTextNormalLineHeight,
      isFontNormal,
      isTextDefaultGradientColor,
      isTextPrimaryColor,
      isEmptyBackGroundWithPrimaryColor,
      needVerticalPadding,
      needGradient,
      needAssetImage,
      needIcon,
      needRightAssetImage;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color textColor, backgroundColor, iconColor;
  final void Function()? onPressed;
  final int maxTextLines;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          // needGradient? ElevatedButton.styleFrom(
          //   primary: Colors.transparent,
          //   onSurface: Colors.transparent,
          //   shadowColor: Colors.transparent,
          //   //make color or elevated button transparent
          // ):
          ButtonStyle(
              elevation:
              WidgetStateProperty.all<double>(needGradient ? 0.0 : 1.0),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  // side: BorderSide(color: Colors.red)
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                onPressed == null
                    ? isEmptyBackGroundWithPrimaryColor
                        ? AppColor.white
                        : AppColor.primaryColor.withOpacity(0.6)
                    : needGradient
                        ? Colors.transparent
                        : isEmptyBackGroundWithPrimaryColor
                            ? AppColor.white
                            : backgroundColor,
              ),
              side: isEmptyBackGroundWithPrimaryColor
                  ? WidgetStateProperty.all<BorderSide>(
                      BorderSide(
                        width: borderWidth,
                        color: AppColor.primaryColor,
                      ),
                    )
                  : null),
      onPressed: isLoading ? null : onPressed,
      // child: Container(),
      child: Container(
        padding: needVerticalPadding
            ?  EdgeInsets.symmetric(vertical: isLoading ? 10 : 15)
            : null,
        // width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            needAssetImage
                ? SizedBox(
                    width: assetImageWidth,
                    // height: 50.w,
                    child: Image.asset(
                      assetImage,
                      color: AppColor.white,
                    ),
                  )
                : needIcon
                    ? Icon(
                        icon,
                        color: iconColor,
                        size: iconSize,
                      )
                    : Container(),
            needAssetImage || needIcon ? SizedBox(width: gapSize) : Container(),
            if (isLoading)
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeCap: StrokeCap.round,
                ),
              )
            else
              Flexible(
                child: Text(
                  text,
                  // overflow: TextOverflow.ellipsis,
                  // maxLines: maxTextLines,
                  textAlign: textAlign,
                  style: TextStyle(
                    color: isTextPrimaryColor
                        ? AppColor.primaryColor
                        : isEmptyBackGroundWithPrimaryColor &&
                                textColor == AppColor.white
                            ? AppColor.primaryColor
                            : textColor,
                    fontSize: fontSize,
                    letterSpacing: textLetterSpacing,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            if (needRightAssetImage)
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: assetImageWidth,
                // height: 50.w,
                child: Image.asset(
                  assetImage,
                  color: AppColor.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
