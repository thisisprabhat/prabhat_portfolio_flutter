import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/library/core.dart';

part 'locale_controller.g.dart';

@riverpod
class LocaleController extends _$LocaleController {
  @override
  Locale build() => Locale('en');

  Future<Locale> fetchLocale() async {
    state = await SharedPrefsHelper.fetchLocale();
    return state;
  }

  Future<Locale> changeLocale(Locale locale) async {
    final newLocale = await SharedPrefsHelper.changeLocale(locale);
    state = newLocale;
    return state;
  }
}
