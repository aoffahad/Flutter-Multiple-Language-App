import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:localization_multiple_language/controller/language_controller.dart';
import 'package:localization_multiple_language/screen/splash_screen.dart';
import 'package:get/get.dart';
import 'utils/dep.dart' as dep;
import 'package:localization_multiple_language/utils/app_constants.dart';
import 'package:localization_multiple_language/utils/app_routes.dart';
import 'package:localization_multiple_language/utils/messages.dart';

Future<void> main() async {
  // setpathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  Map<String, Map<String, String>> _languages = await dep.init();
  runApp(MyApp(
    languages: _languages,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
        locale: localizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.getSplashRoute(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
