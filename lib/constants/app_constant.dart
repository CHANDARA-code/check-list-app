import 'dart:ui';

class AppConstant {
  AppConstant._internal();
  static const String appName = 'KELA';
  static const String appLogo = 'assets/logos/kala-app-logo.png';
  static const String appSlogan = 'KELA -  Book your sport place anytime';

  static const Duration automaticReauthenticate = Duration(seconds: 7200);

  static const supportedLocales = [
    Locale('en'),
    Locale('km'),
  ];
}
