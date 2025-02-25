
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../data/model/drop_down/drop_down_model.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_style.dart';

class AppDropDown extends StatelessWidget {
  final dynamic dropDownItems, selectedItem, fieldKey;
  final Function handleClick;

  final String title, isPrefixIconText;
  final String? prefixIconPath, hint, dynamicFormFieldKey, anyExtraData;
  final TextStyle? style, titleTextStyle;

  final double radius, topBottomPadding;
  final FocusNode? focusNode;
  final bool isName,
      enabled,
      isIgnoring,
      needSearch,
      isRequired,
      isTextBlack,
      needTopSpace,
      isTitleBlack,
      isPrefixIconNeeded,
      isPrefixTextNeeded,
      isUnderLineRequired,
      isTitlePrimaryColor,
      isEditTextBorderPrimaryColor,
      isDropDownBackgroundTransparent,
      isBackgroundTransparent;
  final double height, dropdownFieldBorderRadius;
  final Color? hoverColor,
      borderColor,
      errorBorderColor,
      focusedBorderColor,
      enabledBorderColor,
      disabledBorderColor;
  bool isErrorMessageBangla;
  final String? Function(Object?)? validator;
  final TextEditingController searchController = TextEditingController();

  final TextStyle? dropDownItemStyle;

  AppDropDown({
    super.key,
    required this.dropDownItems,
    required this.selectedItem,
    required this.handleClick,
    this.hint,
    this.style,
    this.fieldKey,
    this.validator,
    this.focusNode,
    this.title = "",
    this.hoverColor,
    this.borderColor,
    this.anyExtraData,
    this.radius = 8.0,
    this.height = 50.0,
    this.titleTextStyle,
    this.isName = false,
    this.prefixIconPath,
    this.enabled = true,
    this.errorBorderColor,
    this.isRequired = true,
    this.needSearch = false,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.isTextBlack = true,
    this.isIgnoring = false,
    this.dynamicFormFieldKey,
    this.isTitleBlack = true,
    this.needTopSpace = true,
    this.disabledBorderColor,
    this.topBottomPadding = 15,
    this.isPrefixIconText = "",
    this.isPrefixTextNeeded = false,
    this.isPrefixIconNeeded = false,
    this.isUnderLineRequired = true,
    this.isTitlePrimaryColor = false,
    this.isBackgroundTransparent = false,
    this.isEditTextBorderPrimaryColor = false,
    this.isErrorMessageBangla = false,
    this.isDropDownBackgroundTransparent = false,
    this.dropDownItemStyle,
    this.dropdownFieldBorderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    isErrorMessageBangla = Get.locale?.languageCode == "bn";
    List<DropdownMenuItem<DropDownModel>> dropdownMenuItems =
    buildDropDownMenuItems(dropDownItems);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: needTopSpace,
          child:  appWidget.gapH(12),
        ),
        Visibility(
          visible: title != "",
          child: RichText(
            text: TextSpan(
              text: title,
              style: titleTextStyle ??
                  textRegularStyle(
                    color: isTitleBlack
                        ? AppColor.black
                        : isTitlePrimaryColor
                        ? AppColor.primaryColor
                        : AppColor.white,
                  ),
              children: [
                TextSpan(
                  text: isRequired ? " * " : "",
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: title != "",
          child: appWidget.gapH8(),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2<DropDownModel>(
            dropdownSearchData: needSearch
                ? DropdownSearchData(
              searchController: searchController,
              searchInnerWidgetHeight: sizerH(50),
              searchInnerWidget: Padding(
                padding: EdgeInsets.only(
                  top: sizerH(16),
                  right: sizerW(16),
                  left: sizerW(16),
                ),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: sizerW(12),
                      vertical: sizerH(16),
                    ),
                    hintText: isErrorMessageBangla
                        ? "এখানে অনুসন্ধান করুন ..."
                        : "Search here ...",
                    hintStyle: const TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          dropdownFieldBorderRadius),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return ((item.value?.title ?? "")
                    .toString()
                    .toLowerCase()
                    .contains(
                  searchValue.toLowerCase(),
                ));
              },
            )
                : null,
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                searchController.clear();
              }
            },
            isExpanded: true,
            key: fieldKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            hint: Text(
              hint ??
                  (isErrorMessageBangla
                      ? "$title নির্বাচন করুন"
                      : "Select $title"),
              style: hintStyle,
              maxLines: 1,
            ),
            items: dropdownMenuItems,
            selectedItemBuilder: (BuildContext context) {
              return dropDownItems.map<Widget>((DropDownModel item) {
                return Text(
                  item.title ?? "",
                  maxLines: 1,
                  style: dropDownItemStyle ?? textRegularStyle(),
                );
              }).toList();
            },
            validator: (value) {
              if (!isRequired) {
                return null;
              }
              if (value == null) {
                return isErrorMessageBangla
                    ? "অনুগ্রহ করে একটি অপশন নির্বাচন করুন"
                    : "Please select an option";
              }
              return null;
            },
            onChanged: !enabled
                ? null
                : dropDownItems.isEmpty
                ? null
                : (value) {
              if (value != selectedItem) {
                if (dynamicFormFieldKey != null) {
                  handleClick(dynamicFormFieldKey, value);
                } else {
                  handleClick(value);
                }
              }
            },
            value: selectedItem == null
                ? null
                : (selectedItem.title == null ? null : selectedItem),
            // buttonStyleData: ButtonStyleData(
            //   height: height - 2,
            //   padding: const EdgeInsets.only(right: 8),
            // ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: dropDownItems.isEmpty
                    ? Colors.black26
                    : enabled
                    ? Colors.black54
                    : Colors.black26,
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 0,
                right: 16,
                top: topBottomPadding,
                bottom: topBottomPadding,
              ),
              // contentPadding: EdgeInsets.zero,
              fillColor:
              isDropDownBackgroundTransparent || isBackgroundTransparent
                  ? Colors.transparent
                  : enabled
                  ? AppColor.white
                  : AppColor.disableColor,
              isDense: true,
              filled: true,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (disabledBorderColor ?? AppColor.disableColor),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isEditTextBorderPrimaryColor
                      ? AppColor.primaryColor
                      : (enabledBorderColor ?? AppColor.primaryColor),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (focusedBorderColor ?? AppColor.primaryColor),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
                borderSide: const BorderSide(width: 1, color: Colors.red),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (errorBorderColor ?? AppColor.red), width: 1.0),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
              hoverColor: hoverColor ?? AppColor.primaryColor,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isEditTextBorderPrimaryColor
                      ? AppColor.primaryColor
                      : (borderColor ?? AppColor.red),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(dropdownFieldBorderRadius),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<DropDownModel>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<DropDownModel>> items = [];
    for (DropDownModel listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.title ?? "",
            style: dropDownItemStyle ?? textRegularStyle(),
          ),
        ),
      );
    }
    return items;
  }

  sizerH(double size) {
    return size;
  }

  sizerW(double size) {
    return size;
  }
}
