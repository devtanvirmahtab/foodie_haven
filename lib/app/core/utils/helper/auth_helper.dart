// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:get/get.dart';
// import 'package:soft_builder/constraints/my_constraints.dart';
//
// import '../../../data/model/auth_model/login_response_model.dart';
// import '../../../routes/app_pages.dart';
// import '../../constants/app_constants.dart';
// import '../../constants/keycloak_config.dart';
// import '../../state/global_state.dart';
// import 'app_helper.dart';
//
// class AuthHelper {
//   final FlutterAppAuth appAuth = const FlutterAppAuth();
//
//   final String _clientId = KeyCloakConfig.clientId,
//       _clientSecret = KeyCloakConfig.clientSecret,
//       _logoutUrl = KeyCloakConfig.postLogoutRedirectUrl,
//       _redirectUrl = KeyCloakConfig.redirectUrl;
//   final AuthorizationServiceConfiguration _serviceConfiguration =
//       AuthorizationServiceConfiguration(
//     authorizationEndpoint: KeyCloakConfig.authorizationEndpoint,
//     tokenEndpoint: KeyCloakConfig.tokenEndpoint,
//     endSessionEndpoint: KeyCloakConfig.endSessionEndpoint,
//   );
//
//   final List<String> _scopes = <String>['openid'];
//
//   Future<bool?> loginClickNew(String username, String password) async {
//     String tokenEndpoint = KeyCloakConfig.tokenEndpoint;
//     const String clientId = KeyCloakConfig.clientId;
//     const String clientSecret = KeyCloakConfig.clientSecret;
//
//     try {
//       final dio = Dio();
//       appHelper.showLoader();
//       final response = await dio.post(
//         Uri.parse(tokenEndpoint).toString(),
//         data: {
//           'grant_type': 'password',
//           'username': username,
//           'password': password,
//           'client_id': clientId,
//           'client_secret': clientSecret,
//           "scope": "openid"
//         },
//         options: Options(
//           contentType: Headers.formUrlEncodedContentType,
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         var dataResponse = loginResponseModelFromJson(response.toString());
//
//         logger.i("accessToken: ${dataResponse.accessToken ?? ''}");
//         logger.i("idToken: ${dataResponse.idToken ?? ''}");
//         logger.i("refreshToken: ${dataResponse.refreshToken ?? ''}");
//
//         await _storeTokensToSecureStorage(
//           dataResponse.accessToken ?? "",
//           dataResponse.idToken ?? "",
//           dataResponse.refreshToken ?? "",
//         );
//         appHelper.hideLoader();
//         myWidget.showSimpleToast(
//           "Login Successful",
//           isInfo: true,
//         );
//         return true;
//       }
//     } on DioException catch (e) {
//       logger.i("e: $e");
//       appHelper.hideLoader();
//       if (e.response?.statusCode == 401) {
//         myWidget.showSimpleToast(
//           "Invalid Login Credentials. Please provide Correct Username or Password.",
//           isInfo: true,
//         );
//       } else {
//         myWidget.showSimpleToast(
//           "Something went wrong during login.",
//           isInfo: true,
//         );
//       }
//     } catch (e) {
//       appHelper.hideLoader();
//       logger.i('Error during authentication: $e');
//     }
//     return null;
//   }
//
//   Future<void> _storeTokensToSecureStorage(
//     String saveAccessToken,
//     String saveIDToken,
//     String saveRefreshToken,
//   ) async {
//     await appHelper.saveToken(saveAccessToken);
//     await appHelper
//         .saveTokenTime(DateTime.now().microsecondsSinceEpoch.toString());
//     await appHelper.saveIdToken(saveIDToken);
//     await appHelper.saveRefreshToken(saveRefreshToken);
//   }
//
//   _loginFunctionality() async {
//     try {
//       appHelper.showLoader();
//       final AuthorizationTokenResponse? result =
//       await appAuth.authorizeAndExchangeCode(
//         AuthorizationTokenRequest(
//           _clientId,
//           _redirectUrl,
//           clientSecret: _clientSecret,
//           serviceConfiguration: _serviceConfiguration,
//           scopes: _scopes,
//         ),
//       );
//       logger.i("Result: $result");
//
//       appHelper.hideLoader();
//       await _storeTokensToSecureStorage(
//         result?.accessToken ?? "",
//         result?.idToken ?? "",
//         result?.refreshToken ?? "",
//       );
//
//       logger.i("result accessToken: ${result?.accessToken}");
//       logger.i("result idToken: ${result?.idToken}");
//       logger.i("result refreshToken: ${result?.refreshToken}");
//
//       Get.find<GlobalState>().isLoggedIn.value = true;
//     } catch (e) {
//       appHelper.hideLoader();
//       logger.i("exception in login: $e");
//     }
//   }
//
//   logout() async {
//     try {
//       await Get.find<GlobalState>().sendDeviceToken("no    device ");
//     } catch (e) {
//       logger.i("exception on sending empty device token");
//     }
//
//     try {
//       appHelper.showLoader();
//       String? idToken = await appHelper.getIdToken();
//       logger.i("idToken : $idToken");
//
//       Get.find<GlobalState>().isLoggedIn.value = false;
//       logger.i("successfully logged out");
//       deleteAllTokens();
//       appHelper.clearDataAfterLogout();
//       appHelper.hideLoader();
//       Get.offAllNamed(Routes.SPLASH_SCREEN);
//     } catch (e) {
//       appHelper.hideLoader();
//       logger.i("Exception in logout: $e");
//     }
//   }
//
//   deleteAllTokens() async {
//     await appHelper.deleteToken();
//     await appHelper.deleteIdToken();
//     await appHelper.deleteRefreshToken();
//   }
//
//   Future<bool?> refreshTokenUsingApiMethod() async {
//     String tokenEndpoint = KeyCloakConfig.tokenEndpoint;
//     const String clientId = KeyCloakConfig.clientId;
//     const String clientSecret = KeyCloakConfig.clientSecret;
//
//     try {
//       final dio = Dio();
//
//       var refreshToken = await AppHelper().getRefreshToken();
//
//       // appHelper.showLoader();
//
//       String basicAuth =
//           'Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}';
//       final response = await dio.post(
//         tokenEndpoint,
//         data: {'grant_type': 'refresh_token', "refresh_token": refreshToken},
//         options: Options(
//           contentType: Headers.formUrlEncodedContentType,
//           headers: <String, String>{'authorization': basicAuth},
//         ),
//       );
//       logger.i("response: ${response.toString()}");
//
//       if (response.statusCode == 200) {
//         var dataResponse = loginResponseModelFromJson(response.toString());
//
//         logger.i("accessToken: ${dataResponse.accessToken ?? ''}");
//         logger.i("idToken: ${dataResponse.idToken ?? ''}");
//         logger.i("refreshToken: ${dataResponse.refreshToken ?? ''}");
//
//         await _storeTokensToSecureStorage(
//           dataResponse.accessToken ?? "",
//           dataResponse.idToken ?? "",
//           dataResponse.refreshToken ?? "",
//         );
//         // appHelper.hideLoader();
//         // await Get.find<GlobalState>().startTokenFetchScheduler();
//         await Get.find<GlobalState>().scheduleRefreshTokenCorn();
//
//         /*myWidget.showSimpleToast(
//           "Fetched Refresh token Successfully",
//           isInfo: true,
//         );*/
//         return true;
//       }
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 401) {
//         logger.i("Exception: $e");
//         myWidget.showSimpleToast(
//           "You have session out so you are being logged out. ",
//           isInfo: true,
//         );
//         logout();
//       }
//     } catch (e) {
//       appHelper.hideLoader();
//       logger.i('Error during authentication: $e');
//     }
//     return null;
//   }
// }
