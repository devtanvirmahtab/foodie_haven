import 'package:get/get.dart';

import '../../constants/tr_constant.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": english,
        "bn": bangla,
      };

  final Map<String, String> english = {
    // search_result_for_search_key_p: "Search result for @searchKey",
  };

  final Map<String, String> bangla = {
    hello: "Bangla",
  };
}
