import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

import '/core/utils/shared_prefs_helper.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() => ThemeMode.system;

  Future<ThemeMode> fetchThemeMode() async {
    state = await SharedPrefsHelper.fetchThemeMode();
    return state;
  }

  Future<ThemeMode> changeThemeMode(ThemeMode themeMode) async {
    final newThemeMode = await SharedPrefsHelper.changeThemeMode(themeMode);
    state = newThemeMode;
    return state;
  }
}
