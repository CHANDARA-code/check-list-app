import 'dart:ui';

class AppConstant {
  AppConstant._internal();
  static const Duration automaticReauthenticate = Duration(seconds: 7200);
  static const supportedLocales = [
    Locale('en'),
    Locale('km'),
  ];
}
