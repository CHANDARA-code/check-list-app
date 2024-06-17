import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConstant {
  static ThemeConstant? _instance;

  static ThemeConstant get instance {
    _instance ??= ThemeConstant._init();
    return _instance!;
  }

  ThemeConstant._init();
  // Light themes
  ThemeData get materialLightTheme =>
      MaterialTheme(textTheme: GoogleFonts.aBeeZeeTextTheme()).light();
  // Dark themes
  ThemeData get materialDarkTheme =>
      MaterialTheme(textTheme: GoogleFonts.aBeeZeeTextTheme()).dark();
}

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme({required this.textTheme});

  // Light color scheme
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF1E88E5),
      surfaceTint: Color(0xFF1E88E5),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFBBDEFB),
      onPrimaryContainer: Color(0xFF000000),
      secondary: Color(0xFF43A047),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFC8E6C9),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xFFFFC107),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFECB3),
      onTertiaryContainer: Color(0xFF000000),
      error: Color(0xFFD32F2F),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFCDD2),
      onErrorContainer: Color(0xFF000000),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
      onSurfaceVariant: Color(0xFF424242),
      outline: Color(0xFF757575),
      outlineVariant: Color(0xFFBDBDBD),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF303030),
      inversePrimary: Color(0xFF90CAF9),
      primaryFixed: Color(0xFFBBDEFB),
      onPrimaryFixed: Color(0xFF000000),
      primaryFixedDim: Color(0xFF90CAF9),
      onPrimaryFixedVariant: Color(0xFF1E88E5),
      secondaryFixed: Color(0xFFC8E6C9),
      onSecondaryFixed: Color(0xFF000000),
      secondaryFixedDim: Color(0xFFA5D6A7),
      onSecondaryFixedVariant: Color(0xFF43A047),
      tertiaryFixed: Color(0xFFFFECB3),
      onTertiaryFixed: Color(0xFF000000),
      tertiaryFixedDim: Color(0xFFFFD54F),
      onTertiaryFixedVariant: Color(0xFFFFC107),
      surfaceDim: Color(0xFFFAFAFA),
      surfaceBright: Color(0xFFFFFFFF),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF5F5F5),
      surfaceContainer: Color(0xFFEEEEEE),
      surfaceContainerHigh: Color(0xFFE0E0E0),
      surfaceContainerHighest: Color(0xFFBDBDBD),
    );
  }

  // Dark color scheme
  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF90CAF9),
      surfaceTint: Color(0xFF90CAF9),
      onPrimary: Color(0xFF000000),
      primaryContainer: Color(0xFF1E88E5),
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFFA5D6A7),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFF43A047),
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(0xFFFFD54F),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFFFFC107),
      onTertiaryContainer: Color(0xFFFFFFFF),
      error: Color(0xFFFFCDD2),
      onError: Color(0xFF000000),
      errorContainer: Color(0xFFD32F2F),
      onErrorContainer: Color(0xFFFFFFFF),
      surface: Color(0xFF303030),
      onSurface: Color(0xFFFFFFFF),
      onSurfaceVariant: Color(0xFFBDBDBD),
      outline: Color(0xFF9E9E9E),
      outlineVariant: Color(0xFF424242),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFFAFAFA),
      inversePrimary: Color(0xFF1E88E5),
      primaryFixed: Color(0xFF1E88E5),
      onPrimaryFixed: Color(0xFFFFFFFF),
      primaryFixedDim: Color(0xFF1E88E5),
      onPrimaryFixedVariant: Color(0xFFBBDEFB),
      secondaryFixed: Color(0xFF43A047),
      onSecondaryFixed: Color(0xFFFFFFFF),
      secondaryFixedDim: Color(0xFF43A047),
      onSecondaryFixedVariant: Color(0xFFC8E6C9),
      tertiaryFixed: Color(0xFFFFC107),
      onTertiaryFixed: Color(0xFFFFFFFF),
      tertiaryFixedDim: Color(0xFFFFC107),
      onTertiaryFixedVariant: Color(0xFFFFECB3),
      surfaceDim: Color(0xFF212121),
      surfaceBright: Color(0xFF303030),
      surfaceContainerLowest: Color(0xFF212121),
      surfaceContainerLow: Color(0xFF2C2C2C),
      surfaceContainer: Color(0xFF333333),
      surfaceContainerHigh: Color(0xFF3A3A3A),
      surfaceContainerHighest: Color(0xFF4A4A4A),
    );
  }

  // ThemeData for light scheme
  ThemeData light() {
    return theme(lightScheme());
  }

  // ThemeData for dark scheme
  ThemeData dark() {
    return theme(darkScheme());
  }

  // Generic theme method
  ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.aBeeZeeTextTheme(
        textTheme.apply(
            bodyColor: colorScheme.onSurface,
            displayColor: colorScheme.onSurface),
      ),
      scaffoldBackgroundColor: colorScheme.background,
      useMaterial3: true,
    );
  }
}
