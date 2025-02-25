import 'package:get/get.dart';

class GlobalState extends GetxController {
  @override
  onInit() {
    super.onInit();
  }

  onManualInit() async {}

// getProfileApi() async {
//   var queryParam = <String, dynamic>{};
//   var response = await ApiClient().getAPI(
//     profileUrl,
//     getProfileApi,
//     isHeaderRequired: true,
//     mQueryParameters: queryParam,
//   );
//
//   logger.d(response);
//
//   if (response != null) {
//     ProfileModel model = profileModelFromJson(response.toString());
//     if (model.success ?? false) {
//       profileData.value = model.data ?? Data();
//     }
//   }
// }
}
