import 'package:flutter/material.dart';
import 'package:prabhat_portfolio_flutter/core/extensions/string_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  static bool _animate = true;
  static bool get animate => _animate;
  static const _animateKey = 'animate';
  static Future<bool> toggleAnimation() async {
    _animate = !_animate;
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.setBool(_animateKey, _animate);
    return animate;
  }

  static Future<bool> fetchAnimation() async {
    _prefs ??= await SharedPreferences.getInstance();
    _animate = _prefs!.getBool(_animateKey) ?? true;
    return animate;
  }

  //! Theme Switcher ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  static ThemeMode _themeMode = ThemeMode.system;
  static ThemeMode get themeMode => _themeMode;
  static const _themeKey = 'themeMode';
  static Future<ThemeMode> changeThemeMode(ThemeMode themeMode) async {
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.setString(_themeKey, themeMode.name);
    return themeMode;
  }

  static Future<ThemeMode> fetchThemeMode() async {
    _prefs ??= await SharedPreferences.getInstance();
    final result = _prefs!.getString(_themeKey);
    _themeMode = result?.toEnum(ThemeMode.values) ?? ThemeMode.system;
    return themeMode;
  }

  //! Locale Switcher ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  static Locale currentLocale = Locale('en');
  static const _localeKey = 'locale';

  static Future<Locale> changeLocale(Locale locale) async {
    currentLocale = locale;
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.setString(_localeKey, locale.languageCode);
    return currentLocale;
  }

  static Future<Locale> fetchLocale() async {
    _prefs ??= await SharedPreferences.getInstance();
    final localeCode = _prefs!.getString(_localeKey);
    currentLocale = Locale(
      localeCode == null || localeCode == '' ? 'en' : localeCode,
    );

    return currentLocale;
  }

  //! Clear All ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  static Future<void> clearAll() async {
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.clear();
  }
}
