import 'dart:core';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:localization_multiple_language/screen/language_screen.dart';

import '../screen/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';

  static String getSplashRoute() => '$splash';
  static String getInitialRoute() => '$initial';
  static String getLanguageRoute() => '$language';

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () {
          return const SplashScreenPage();
        }),
    GetPage(
        name: language,
        page: () {
          return const LanguageScreen();
        }),
  ];
}
