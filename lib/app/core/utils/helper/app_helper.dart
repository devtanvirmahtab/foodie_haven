import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/app_constants.dart';

class AppHelper {
  final storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage
        .write(key: "token", value: token)
        .whenComplete(() => logger.d('saveToken:  Saved'));
  }

  Future<String?> getToken() async {
    try {
      final accessToken = await storage.read(key: "token");
      return accessToken;
    } on PlatformException {
      await storage.deleteAll();
    }
    return null;
  }

  Future deleteToken() async {
    logger.i("Deleted Token");
    await storage.delete(key: "token").then((_) {
      // Get.offAndToNamed(Routes.LOGIN);
    });
  }

  //
  // Future<void> saveTokenTime(String token) async {
  //   await storage
  //       .write(key: "token_time", value: token)
  //       .whenComplete(() => logger.d('saveTokenTime:  Saved'));
  // }
  //
  // Future<String?> getTokenTime() async {
  //   try {
  //     final accessToken = await storage.read(key: "token_time");
  //     return accessToken;
  //   } on PlatformException {
  //     await storage.deleteAll();
  //   }
  //   return null;
  // }
  //
  // deleteTokenTime() async {
  //   logger.i("Deleted: Token Time");
  //   await storage.delete(key: "token_time");
  // }
  //
  // Future<void> saveRefreshToken(String token) async {
  //   await storage
  //       .write(key: "refreshToken", value: token)
  //       .whenComplete(() => logger.d('saveRefreshToken:  refreshToken'));
  // }
  //
  // Future<String?> getRefreshToken() async {
  //   try {
  //     final accessToken = await storage.read(key: "refreshToken");
  //     return accessToken;
  //   } on PlatformException {
  //     await storage.deleteAll();
  //   }
  //   return null;
  // }
  //
  // deleteRefreshToken() async {
  //   logger.i("refreshToken Delete");
  //   await storage.delete(key: "refreshToken");
  // }
  //
  // Future<void> saveIdToken(String token) async {
  //   await storage
  //       .write(key: "idToken", value: token)
  //       .whenComplete(() => logger.d('saveIdToken:  Saved'));
  // }
  //
  // Future<String?> getIdToken() async {
  //   try {
  //     final accessToken = await storage.read(key: "idToken");
  //     return accessToken;
  //   } on PlatformException {
  //     await storage.deleteAll();
  //   }
  //   return null;
  // }
  //
  // deleteIdToken() async {
  //   logger.i("idToken Delete");
  //   await storage.delete(key: "idToken");
  // }
  //
  // saveInitialAppAccess(String token) async {
  //   await storage
  //       .write(key: "initial_app_access", value: token)
  //       .whenComplete(() => logger.d('saveInitialAppAccess:  Saved'));
  // }
  //
  // Future<String?> getInitialAppAccess() async {
  //   try {
  //     final accessToken = await storage.read(key: "initial_app_access");
  //     return accessToken;
  //   } on PlatformException {
  //     await storage.deleteAll();
  //   }
  //   return null;
  // }
  //
  // saveLocale(String locale) async {
  //   await storage
  //       .write(key: "locale", value: locale)
  //       .whenComplete(() => debugPrint('saveLocale:  Locale Saved'));
  // }
  //
  // Future<String?> getLocale() async {
  //   return await storage.read(key: "locale");
  // }
  //
  // Future<void> saveUserRole(String role) async {
  //   await storage
  //       .write(key: "role", value: role)
  //       .whenComplete(() => logger.d('saveToken:  Saved'));
  // }
  //
  // Future<String?> getUserRole() async {
  //   try {
  //     final userRole = await storage.read(key: "role");
  //     return userRole;
  //   } on PlatformException {
  //     await storage.deleteAll();
  //   }
  //   return null;
  // }
  //
  // deleteUserRole() async {
  //   logger.i("Deleted");
  //   await storage.delete(key: "role");
  // }
  //
  // hideLoader() {
  //   if (EasyLoading.isShow) {
  //     EasyLoading.dismiss();
  //   }
  // }
  //
  hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  //
  // unFocus() {
  //   FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  //   if (!currentFocus.hasPrimaryFocus) {
  //     currentFocus.unfocus();
  //   }
  // }
  //
  // showLoader({needToShow = true}) {
  //   if (needToShow) {
  //     if (!EasyLoading.isShow) {
  //       return EasyLoading.show(
  //         status: "Loading...",
  //         maskType: EasyLoadingMaskType.black,
  //         dismissOnTap: kDebugMode ? true : false,
  //       );
  //     }
  //   }
  // }
  //
  // validateImageURL(String url) {
  //   String finalUrl = url;
  //   if (!url.startsWith("assets")) {
  //     if (url.startsWith("upload")) {
  //       finalUrl = imageUrl + url;
  //     } else if (url.startsWith("/storage")) {
  //       finalUrl = imageUrl + url;
  //     } else if (!url.contains("/")) {
  //       finalUrl = imageUrl + url;
  //     } else if (!url.contains("http")) {
  //       finalUrl = imageUrl + url;
  //     }
  //   }
  //   return finalUrl;
  // }
  //
  // isValidImageUrl(String? url) {
  //   if (url == null) {
  //     return false;
  //   } else {
  //     if (url == imageUrl || url == "") {
  //       return false;
  //     }
  //     return true;
  //   }
  // }
  //
  // String getOrdinal(int number) {
  //   if (number % 100 >= 11 && number % 100 <= 13) {
  //     return '${number}th';
  //   } else {
  //     switch (number % 10) {
  //       case 1:
  //         return '${number}st';
  //       case 2:
  //         return '${number}nd';
  //       case 3:
  //         return '${number}rd';
  //       default:
  //         return '${number}th';
  //     }
  //   }
  // }
  //
  // clearDataAfterLogout({needToShowMsg = false}) async {
  //   storage.deleteAll();
  // }

  argumentValidator(String key, dynamic isNullVal) {
    dynamic data = Get.arguments[key];
    if (data == null) {
      data = isNullVal;
    }
    return data;
  }

  formatDate(String date) {
    DateTime inputDate = DateTime.parse(date);
    String formattedDate = DateFormat('MMM d, y h:mm a').format(inputDate);
    return formattedDate;
  }

  formatDateOnly(String date) {
    DateTime inputDate = DateTime.parse(date);
    String formattedDate = DateFormat('dd-MM-y').format(inputDate);
    return formattedDate;
  }

  String replaceNumber(String input) {
    try {
      String locale = Get.locale?.languageCode ?? "en";
      const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      if (locale == "bn") {
        const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
        for (int i = 0; i < english.length; i++) {
          input = input.replaceAll(english[i], bangla[i]);
        }
      }
      /*else if (locale == "hi") {
        const hindi = ['०', '१', '२', '३', '४', '५', '६', '७', '८', '९'];
        for (int i = 0; i < english.length; i++) {
          input = input.replaceAll(english[i], hindi[i]);
        }
      }*/
      return input;
    } catch (e) {
      // logger.d('convertTransactionDateFormat:  $e');
      return input;
    }
  }

  String showNameLogic(String? nameBN, String? nameEN) {
    String locale = Get.locale?.languageCode ?? "en";
    if (locale == "bn") {
      return nameBN ?? nameEN ?? "";
    } else {
      return nameEN ?? nameBN ?? "";
    }
  }

  // Future<void> launchPhoneDialer(String contactNumber) async {
  //   logger.i("Email launch $contactNumber");
  //   final Uri phoneUri = Uri(scheme: "tel", path: contactNumber);
  //   try {
  //     if (await canLaunchUrl(phoneUri)) {
  //       await launchUrl(phoneUri);
  //     }
  //   } catch (error) {
  //     throw ("Cannot dial $phoneUri");
  //   }
  // }
  //
  // Future<void> launchEmail(String email) async {
  //   logger.i("Email launch $email");
  //   final Uri emailUri = Uri(scheme: "mailto", path: email);
  //   try {
  //     if (await canLaunchUrl(emailUri)) {
  //       await launchUrl(emailUri);
  //     }
  //   } catch (error) {
  //     throw ("Cannot send email to $emailUri");
  //   }
  // }

  String getFormatTimeFromString(String? timeStamps,
      {bool isConversation = false}) {
    if (timeStamps == null) return "";
    return getFormatTime(
      DateTime.parse(timeStamps).toLocal(),
      isConversation: isConversation,
    );
  }

  String getFormatTime(DateTime? dateTime, {bool isConversation = false}) {
    if (dateTime == null) return "";
    DateTime now = DateTime.now();
    DateTime localDateTime = dateTime;
    String roughTimeString = DateFormat('jm').format(dateTime);
    DateTime yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return isConversation ? roughTimeString : "Today $roughTimeString";
    } else if (localDateTime.day == yesterday.day &&
        localDateTime.month == yesterday.month &&
        localDateTime.year == yesterday.year) {
      return isConversation ? "Yesterday" : "Yesterday $roughTimeString";
    } else if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);
      return isConversation ? weekday : "$weekday $roughTimeString";
    } else {
      return isConversation
          ? DateFormat("MMMd").format(dateTime)
          : "${DateFormat('yMd').format(dateTime)} $roughTimeString";
    }
  }
}
