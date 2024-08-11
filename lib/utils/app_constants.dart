import 'package:localization_multiple_language/model/language_model.dart';

class AppConstants {
  static const String COUNTRY_CODE = 'country_code';
  static const LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "en.png",
        languageName: 'English',
        languageCode: 'en',
        countryCode: 'US'),
    LanguageModel(
        imageUrl: "bn.png",
        languageName: 'বাংলা',
        languageCode: 'bn',
        countryCode: 'BD'),
  ];
}
