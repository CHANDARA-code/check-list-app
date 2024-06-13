import 'package:flutter/material.dart';

class ThemeConstant {
  static const Color disableColor = Color(0xFFB9B3B3);
  static final success = Color(0xFF3DAF35);

  static const ColorScheme lightScheme = ColorScheme(
    background: Color(0xFFF3F2F2),
    onBackground: Color(0xFFE8E6E6),
    primary: Color(0xFFFE2A43),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF0099FF),
    onSecondary: Color(0xFF202020),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF170103),
    error: Color(0xFFFE2A43),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightScheme.surface,
    colorScheme: lightScheme,
    primaryColor: lightScheme.primary,
    textTheme: textTheme(),
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: lightScheme.surface,
      elevation: 0.0,
      iconTheme: IconThemeData(color: lightScheme.onSurface),
      titleTextStyle: textTheme().headlineSmall?.copyWith(
        color: lightScheme.onSurface,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static TextTheme textTheme({List<String>? fonts}) {
    List<String> fontFamily = fonts ?? ["Montserrat", "Nokora"];
    final Color color = lightScheme.onSurface;
    final Color displayColor = Color(0xFF8B8081);
    TextTheme textTheme = Typography.material2018().black;
    return textTheme
        .copyWith(
          displayLarge: TextStyle(
            fontSize: 98,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            fontFamilyFallback: fontFamily,
          ),
          displayMedium: TextStyle(
            fontSize: 61,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            fontFamilyFallback: fontFamily,
          ),
          displaySmall: TextStyle(
            fontSize: 49,
            fontWeight: FontWeight.w400,
            fontFamilyFallback: fontFamily,
          ),
          headlineMedium: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            fontFamilyFallback: fontFamily,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamilyFallback: fontFamily,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            fontFamilyFallback: fontFamily,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
            fontFamilyFallback: fontFamily,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            fontFamilyFallback: fontFamily,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            fontFamilyFallback: fontFamily,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            fontFamilyFallback: fontFamily,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
            fontFamilyFallback: fontFamily,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            fontFamilyFallback: fontFamily,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            fontFamilyFallback: fontFamily,
          ),
        )
        .apply(
          bodyColor: color,
          displayColor: displayColor,
        );
  }
}
