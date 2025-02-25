import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_style.dart';

class AppEditText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final RegExp? regex;
  final String title;
  final String? hintText,
      helperText,
      validatorMSG,
      dynamicKeyName,
      passwordForConfirm,
      errorMsg,
      minLengthMsg,
      invalidEmailMsg,
      invalidMobileNumber,
      conformPasswordDoesNotMatchMsg;
  final bool isEmail,
      isGmail,
      enabled,
      isBangla,
      isReadonly,
      showCursor,
      isRequired,
      needToShowStar,
      isPassword,
      needCapital,
      isTitleBlack,
      needTopSpace,
      isFilePicker,
      needToShowEye,
      doNeedToSaveUsernameOnGoogle,
      doNeedToSavePasswordOnGoogle,
      capitalLetter,
      isMobileNumber,
      isNumberKeyboard,
      isSignedNumberKeyboard,
      showValidatorMSG,
      isTitlePrimaryColor,
      isBackgroundTransparent,
      isShowEye,
      isForSearch;

  final Pattern? regXValue;
  final void Function(String)? onChanged;
  final int maxLength, minLine;
  final int? maxLine;
  final int? validLength, minLength;

  final double textFieldBorderRadius, topBottomPadding;
  final double? height,
      topLeftRadius,
      topRightRadius,
      bottomLeftRadius,
      bottomRightRadius;
  final IconData? prefixIcon, suffixIcon;
  final Color? borderColor,
      errorBorderColor,
      enabledBorderColor,
      disabledBorderColor,
      focusedBorderColor,
      hoverColor,
      fillColor;
  final Widget? prefixWidget;
  final Function()? onEditingComplete;

  final FocusNode? focusNode, nextFocus;
  final TextStyle? titleStyle;
  dynamic inputFormatter,
      clickListener,
      selectedItem,
      eyeClick,
      fieldKey,
      suffixIconOnclick;
  final TextInputType? keyboardType;

  AppEditText({
    super.key,
    required this.title,
    required this.controller,
    this.regex,
    this.fieldKey,
    this.hintText,
    this.eyeClick,
    this.errorMsg,
    this.focusNode,
    this.nextFocus,
    this.minLength,
    this.onChanged,
    this.regXValue,
    this.helperText,
    this.titleStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnclick,
    this.hoverColor,
    this.validLength,
    this.minLengthMsg,
    this.invalidEmailMsg,
    this.prefixWidget,
    this.invalidMobileNumber,
    this.clickListener,
    this.inputFormatter,
    this.keyboardType,
    this.dynamicKeyName,
    this.focusedBorderColor,
    this.passwordForConfirm,
    this.conformPasswordDoesNotMatchMsg,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.height,
    this.minLine = 1,
    this.maxLine = 1,
    this.maxLength = 250,
    this.validatorMSG = "",
    this.topBottomPadding = 16,
    this.needToShowStar = true,
    this.isShowEye = true,
    this.enabled = true,
    this.isEmail = false,
    this.isGmail = false,
    this.isBangla = false,
    this.showCursor = true,
    this.isRequired = true,
    this.isReadonly = false,
    this.isPassword = false,
    this.needCapital = false,
    this.needTopSpace = true,
    this.isTitleBlack = true,
    this.isFilePicker = false,
    this.capitalLetter = false,
    this.needToShowEye = false,
    this.isMobileNumber = false,
    this.isNumberKeyboard = false,
    this.isForSearch = false,
    this.doNeedToSaveUsernameOnGoogle = false,
    this.doNeedToSavePasswordOnGoogle = false,
    this.isSignedNumberKeyboard = false,
    this.showValidatorMSG = false,
    this.isTitlePrimaryColor = false,
    this.isBackgroundTransparent = false,
    this.borderColor,
    this.errorBorderColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.textInputType = TextInputType.text,
    this.textFieldBorderRadius = appDefaultBorderRadius,
    this.onEditingComplete,
    this.fillColor,
  });

  bool isVisible = false;

  bool isError = false;

  @override
  Widget build(BuildContext context) {
    if (textInputType == const TextInputType.numberWithOptions(signed: true) ||
        isMobileNumber ||
        isSignedNumberKeyboard) {
      inputFormatter = [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ];
    }
    RegExp phoneNumberRegex = RegExp(r'^01\d{9}$');
    RegExp banglaRegex = RegExp(r'[ঀ-৿]+');
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: needTopSpace,
          // child: myWidget.gapH(widgetToTitlePadding),
          child: const SizedBox(
            height: 10,
          ),
        ),
        Visibility(
          visible: title != "",
          child: RichText(
            text: TextSpan(
                text: title,
                style: titleStyle ??
                    textRegularStyle(
                      color: isTitleBlack
                          ? AppColor.black
                          : isTitlePrimaryColor
                              ? AppColor.primaryColor
                              : AppColor.white,
                    ),
                children: [
                  TextSpan(
                      text: isRequired && needToShowStar ? ' *' : "",
                      style: const TextStyle(
                        color: Colors.red,
                      ))
                ]),
          ),
        ),
        Visibility(
          visible: title != "",
          child: const SizedBox(
            height: 10,
          ),
        ),
        TextFormField(
          key: fieldKey,
          autofillHints: doNeedToSaveUsernameOnGoogle
              ? const [AutofillHints.newUsername]
              : (doNeedToSavePasswordOnGoogle
                  ? const [AutofillHints.password]
                  : null),
          onTap: () {
            clickListener != null
                ? isFilePicker
                    ? clickListener(controller, dynamicKeyName)
                    : clickListener()
                : null;
          },
          textCapitalization: needCapital
              ? TextCapitalization.characters
              : TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          readOnly: isFilePicker || isReadonly,
          showCursor: !isReadonly && !isFilePicker && showCursor,
          obscureText: isPassword ? (isShowEye ? true : false) : false,
          maxLines: maxLine,
          minLines: minLine,
          maxLength: isMobileNumber ? 11 : maxLength,
          inputFormatters: inputFormatter,
          scrollPadding: EdgeInsets.zero,
          focusNode: focusNode,
          style: textRegularStyle(),
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: (_) {
            focusNode?.unfocus();
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          },
          keyboardType: isMobileNumber
              ? TextInputType.phone
              : isNumberKeyboard || isSignedNumberKeyboard
                  ? TextInputType.number
                  : isEmail
                      ? TextInputType.emailAddress
                      : keyboardType ?? TextInputType.text,
          validator: (value) {
            if (!isRequired) {
              if (value != "" &&
                  dynamicKeyName != null &&
                  regexConfig[dynamicKeyName] != null) {
                if (!(regexConfig[dynamicKeyName]?.hasMatch(value ?? "  ") ??
                    true)) {
                  return "Input is not valid";
                }
              }
              return null;
            }
            if (value == null || value == "") {
              return isFilePicker
                  ? "Pick a valid Image"
                  : errorMsg ?? "Enter a value";
            } else if (dynamicKeyName != null &&
                regexConfig[dynamicKeyName] != null) {
              if (!(regexConfig[dynamicKeyName]?.hasMatch(value) ?? true)) {
                return errorMsg ?? "Input is not valid";
              }
            } else if (regex != null) {
              if (!(regex?.hasMatch(value) ?? true)) {
                return "Input is not valid";
              }
            } else if (isGmail) {
              if (!RegExp(gmailREGX.toString()).hasMatch(value)) {
                return validatorMSG;
              }
            } else if (capitalLetter) {
              if (!RegExp(capitalLetterREGX.toString()).hasMatch(value)) {
                return validatorMSG;
              }
            } else if (isMobileNumber) {
              if (!phoneNumberRegex.hasMatch(value)) {
                return invalidMobileNumber ?? "Invalid Mobile Number";
              }
            } else if (validLength != null && validLength != value.length) {
              return validatorMSG;
            } else if (showValidatorMSG) {
              if (validatorMSG != "") {
                return validatorMSG;
              }
            } else if (passwordForConfirm != null) {
              if (passwordForConfirm != value) {
                return conformPasswordDoesNotMatchMsg ??
                    "Password doesn't match";
              }
            } else if (isEmail) {
              if (!emailRegex.hasMatch(value)) {
                return invalidEmailMsg ?? "Invalid Email Address";
              }
            } else if (isBangla) {
              if (!banglaRegex.hasMatch(value)) {
                return "দয়া করে বাংলায় লিখুন";
              }
            } else if (isPassword && minLength != null) {
              if (value.length < (minLength ?? 999)) {
                return minLengthMsg ?? "Password must be $minLength digits";
              }
            } else if (minLength != null) {
              if (value.length < (minLength ?? 999)) {
                return minLengthMsg ??
                    "Field must be at least $minLength ${isMobileNumber || isNumberKeyboard ? 'Digits' : 'characters'}";
              }
            }

            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 0,
              right: 16,
              top: topBottomPadding,
              bottom: topBottomPadding,
            ),
            counterText: "",
            enabled: enabled,
            hintText: hintText ?? title,
            hintStyle: hintStyle,
            helperText: helperText,
            helperStyle: const TextStyle(
              color: AppColor.red,
            ),
            filled: true,
            fillColor: isBackgroundTransparent
                ? AppColor.transparent
                : fillColor ?? AppColor.white,
            prefix: prefixWidget ??
                const Padding(padding: EdgeInsets.only(left: 16)),
            prefixIcon: isFilePicker
                ? chooseFileDesign()
                : (prefixIcon == null
                    ? null
                    : Icon(
                        prefixIcon,
                        color: AppColor.primaryColor,
                      )),
            suffixIcon: needToShowEye
                ? InkWell(
                    onTap: () {
                      eyeClick();
                    },
                    child: Icon(
                      isShowEye ? Icons.visibility_off : Icons.visibility,
                      color: AppColor.simpleTextColor,
                    ),
                  )
                : (suffixIcon == null
                    ? null
                    : InkWell(
                        onTap: suffixIconOnclick,
                        child: Icon(
                          suffixIcon,
                          color: AppColor.primaryColor,
                        ),
                      )),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (disabledBorderColor ?? AppColor.disableColor),
                width: isForSearch ? 2.0 : 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (enabledBorderColor ?? AppColor.primaryColor),
                width: isForSearch ? 2.0 : 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (focusedBorderColor ?? AppColor.primaryColor),
                width: isForSearch ? 2.0 : 1.0,
              ),
              borderRadius: borderRadius(),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius(),
              borderSide:
                  BorderSide(width: isForSearch ? 2.0 : 1, color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: (errorBorderColor ?? AppColor.red),
                  width: isForSearch ? 2.0 : 1.0),
              borderRadius: borderRadius(),
            ),
            hoverColor: hoverColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primaryColor,
                width: isForSearch ? 2.0 : 1.0,
              ),
              borderRadius: borderRadius(),
            ),
          ),
        ),
      ],
    );
  }

  borderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeftRadius ?? textFieldBorderRadius),
      topRight: Radius.circular(topRightRadius ?? textFieldBorderRadius),
      bottomLeft: Radius.circular(bottomLeftRadius ?? textFieldBorderRadius),
      bottomRight: Radius.circular(bottomRightRadius ?? textFieldBorderRadius),
    );
    // return BorderRadius.circular(textFieldBorderRadius);
  }

  chooseFileDesign() {
    return Container(
      width: 120,
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10 - 1),
          bottomLeft: Radius.circular(10 - 1),
        ),
      ),
      child: Center(
          child: Text(
        "Choose File",
        style: textRegularStyle(color: AppColor.white),
      )),
    );
  }
}
