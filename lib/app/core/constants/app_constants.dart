import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../utils/helper/app_helper.dart';
import '../widgets/app_widgets.dart';
import 'app_colors.dart';

enum Environment { prod, dev }

enum NotificationType {
  all,
  bill,
  notification,
  offer,
}

final environment = Environment.dev;

const int refreshTokenTimeLimitInMinutes = 20;

final logger = Logger();
// var myWidget = myWidget;
final appHelper = AppHelper();
// final apiClient = ApiClient();
final appWidget = AppWidgets();
final appColors = AppColor();

enum MessageType { text, image }

const Transition transition = Transition.rightToLeft;
const appMainPadding = 20.0;
double mainPaddingW = 20.0;
double mainPaddingH = 20.0;
double borderRadius = 10.0;
const transitionDuration = 300;

const fontSize32 = 32.0;
const fontSize28 = 28.0;
const fontSize24 = 24.0;
const fontSize20 = 20.0;
const fontSize18 = 18.0;
const fontSize16 = 16.0;
const fontSize15 = 15.0;
const fontSize14 = 14.0;
const fontSize13 = 13.0;
const fontSize12 = 12.0;

final Widget gapW3 = appWidget.gapW(3);
final Widget gapW6 = appWidget.gapW(6);
final Widget gapW8 = appWidget.gapW(8);
final Widget gapW12 = appWidget.gapW(12);
final Widget gapW16 = appWidget.gapW(16);
final Widget gapW18 = appWidget.gapW(18);
final Widget gapW20 = appWidget.gapW(20);
final Widget gapW24 = appWidget.gapW(24);
final Widget gapW30 = appWidget.gapW(30);
final Widget gapW34 = appWidget.gapW(34);

final Widget gapH3 = appWidget.gapH(3);
final Widget gapH6 = appWidget.gapH(6);
final Widget gapH8 = appWidget.gapH(8);
final Widget gapH12 = appWidget.gapH(12);
final Widget gapH16 = appWidget.gapH(16);
final Widget gapH18 = appWidget.gapH(18);
final Widget gapH20 = appWidget.gapH(20);
final Widget gapH24 = appWidget.gapH(24);
final Widget gapH30 = appWidget.gapH(30);
final Widget gapH32 = appWidget.gapH(32);
final Widget gapH48 = appWidget.gapH(48);

EdgeInsetsGeometry mainPadding(
  double leftRight,
  double topBottom, {
  double? leftPadding,
  double? rightPadding,
  double? topPadding,
  double? bottomPadding,
}) {
  return EdgeInsets.only(
    left: (leftPadding ?? leftRight),
    right: (rightPadding ?? leftRight),
    top: (topPadding ?? topBottom),
    bottom: (bottomPadding ?? topBottom),
  );
}

double buttonSize = 30;
const appDefaultBorderRadius = 8.0;

var loginTextFieldBorderRadius = BorderRadius.circular(5);
OutlineInputBorder commonOutlineBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.circular(20.0),
);

EdgeInsetsGeometry mainPaddingAll = const EdgeInsets.symmetric(
    horizontal: appMainPadding, vertical: appMainPadding);

EdgeInsetsGeometry mainPaddingAllWH =
    EdgeInsets.symmetric(horizontal: mainPaddingW, vertical: mainPaddingH);

EdgeInsetsGeometry mainPaddingWidthOnly =
    const EdgeInsets.symmetric(horizontal: appMainPadding);

EdgeInsetsGeometry mainPaddingWidthOnlyW =
    EdgeInsets.symmetric(horizontal: mainPaddingW);

EdgeInsetsGeometry mainPaddingHeightOnly =
    EdgeInsets.symmetric(vertical: mainPaddingH);

var borderCircular = BorderRadius.circular(borderRadius);

EdgeInsetsGeometry mainPaddingSymmetric(double amount) {
  return EdgeInsets.symmetric(horizontal: amount, vertical: amount);
}

final regexConfig = {
  "full_name_bn": RegExp(r'[ঀ-৿]+'),
  "father_nid": RegExp(r'^(\d{10}|\d{17})$'),
  "mother_nid": RegExp(r'^(\d{10}|\d{17})$'),
  "birth_registration_no": RegExp(r'^(\d{17})$'),
  "student_email": RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'),
  "student_contact": RegExp(r'^01[1-9][0-9]{8}$'),
  "father_contact_no": RegExp(r'^01[1-9][0-9]{8}$'),
  "local_guardian_contact_no": RegExp(r'^01[1-9][0-9]{8}$'),
  "mother_contact_no": RegExp(r'^01[1-9][0-9]{8}$'),
  "father_name_en": RegExp(r'^[A-Z^.\s]+$'),
  "mother_name_en": RegExp(r'^[A-Z^.\s]+$'),
  "father_yearly_income": RegExp(r'^(?:[0-4]?\d{0,9}|5000000000)$'),
  "roll_number[0]": RegExp(r'^(\d{6})$'),
  "registration_number[0]": RegExp(r'^(\d{10})$'),
  "registration_number[1]": RegExp(r'^(\d{10})$'),
  "youtube_link": RegExp(
      r'^https?:\/\/(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})'),
};

Pattern capitalLetterREGX = r'^[A-Z^.\\s]+$'; // Done
Pattern banglaLetterREGX = r"[ঀ-৿]+"; // Done
Pattern gmailREGX = r"[a-zA-Z0-9@gmail.com]+"; // Need Email Validator

//Need to work
Pattern sscRollREGX = r"^(\\d{6})$"; //
Pattern regnumberREGX = r"^(\\d{10})$"; //

String handleLikeCommentLoveCount(int value) {
  if (value >= 1000) {
    return AppHelper().replaceNumber(NumberFormat.compact().format(value));
  } else {
    return AppHelper().replaceNumber("$value");
  }
}
