import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:localization_multiple_language/controller/language_controller.dart';
import 'package:localization_multiple_language/model/language_model.dart';
import 'package:localization_multiple_language/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreference = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreference);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  //Retriving localized data
  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedjson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    _mappedjson.forEach((key, value) {
      _json[key] = value.toString();
      //print("$_json[key]}");
    });

    //en_US bn_BD
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
