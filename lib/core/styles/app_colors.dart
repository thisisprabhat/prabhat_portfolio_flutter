import 'package:flutter/material.dart';

import '../config/app_config.dart';
import 'styles.dart';

class AppColor {
  //! Base Colors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  /// It will be used mostly on scaffoldBackgroundColor
  final Color backgroundColor;
  final Color onBackground;

  /// All the cards will have this [cardColor]
  final Color cardColor;

  /// headerColor or appBarColor
  final Color surface;

  //! ColorSchemes ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  final Color primary;
  final Color primaryContrast;
  final Color onPrimary;
  final Color secondary;
  final Color secondaryVariant;
  final Color onSecondary;

  bool get isLight => brightness == Brightness.light;
  bool get isDark => brightness == Brightness.dark;

  /// - if light mode then white
  /// - if dark mode then black
  final Color tertiary;

  /// - it will be opposite to [tertiary]
  final Color onTertiary;

  //! Semantics Colors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  final Brightness brightness;
  final Color outline;

  //! Gradients Colors
  final List<Color> primaryGradientColors;

  Color rating = Colors.yellow.shade600;

  //! Constructors ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  static AppColor get light => _light;
  static AppColor get dark => _dark;

  AppColor({
    required this.onBackground,
    required this.cardColor,
    required this.backgroundColor,
    required this.surface,
    required this.primary,
    required this.primaryContrast,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryVariant,
    required this.onSecondary,
    required this.tertiary,
    required this.onTertiary,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.brightness,
    required this.outline,
    required this.primaryGradientColors,
  });
}

//! Color Constants ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

final _dark = AppColor(
  backgroundColor: const Color(0xff1F1F1F),
  onBackground: Color(0xCBFFFFFF),
  primaryContrast: const Color(0xFFFFC49F),
  primary: const Color(0xffEC9560),
  onPrimary: Colors.white,
  secondary: const Color(0xff223976),
  onSecondary: Colors.white,
  secondaryVariant: Color(0xffB5E550),
  tertiary: Colors.white,
  onTertiary: Colors.black,
  success: Colors.green,
  warning: Color(0xFFDA5F02),
  error: Color(0xFFAC0000),
  info: Color(0xFF043260),
  brightness: Brightness.dark,
  surface: const Color(0xff181818),
  outline: const Color(0xFF373737),
  cardColor: Color(0xff312A21),
  primaryGradientColors: [Color(0XFF985E2D), Color(0XFF4B311F)],
);

final _light = AppColor(
  backgroundColor: const Color(0xFFF5F5F5),
  onBackground: Color(0xCB000000),
  primaryContrast: const Color.fromARGB(255, 238, 178, 133),
  primary: const Color(0xFF985E2D),
  onPrimary: Colors.white,
  secondary: const Color(0xFF223976),
  onSecondary: Colors.white,
  secondaryVariant: Color(0xffB5E550),
  tertiary: Colors.black,
  onTertiary: Colors.white,
  success: Colors.green,
  warning: Color(0xFFDA5F02),
  error: Color(0xFFAC0000),
  info: Color(0xFF043260),
  brightness: Brightness.light,
  surface: const Color(0xFFFFFFFF),
  outline: const Color(0xFF373737),
  cardColor: const Color(0xFFFFFFFF),
  primaryGradientColors: [Color(0XFFF6C8A7), Color(0XFF4B311F)],
);

//! Extensions on AppColor ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

extension ThemeExtension on AppColor {
  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    useMaterial3: true,
    brightness: brightness,
    primaryColor: primary,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary,
      selectionHandleColor: primary,
    ),
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: Colors.white,
      surface: surface,
      onSurface: tertiary,
      tertiary: tertiary,
      onTertiary: onTertiary,
      outline: outline,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: borderRadiusDefault),
        padding: paddingDefault,
        backgroundColor: primary,
        foregroundColor: onPrimary,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: borderRadiusDefault),
        padding: paddingDefault,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(borderRadius: borderRadiusDefault),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      titleTextStyle: TextStyle(
        fontFamily: AppConfig.fontFamilyTitle,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
        color: tertiary,
        fontSize: 20,
      ),
    ),
  );
}
