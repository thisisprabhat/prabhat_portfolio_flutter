import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

import '/features/settings/controllers/theme/theme_controller.dart';

import 'library/core.dart';

void main() async {
  await _initialize();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: LocaleConfig.supportedLocales,
        fallbackLocale: LocaleConfig.fallbackLocale,
        path: LocaleConfig.localeAssets,
        assetLoader: const CodegenLoader(),
        useOnlyLangCode: true,
        saveLocale: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ToastificationWrapper(
          config: const ToastificationConfig(itemWidth: 400),
          child: MaterialApp.router(
            title: AppConfig.appName,
            routerConfig: AppRoute.goRouter,
            debugShowCheckedModeBanner: false,
            theme: AppColor.light.theme,
            darkTheme: AppColor.dark.theme,
            themeMode: ref.watch(themeControllerProvider),
            locale: const Locale('en'),
          ),
        );
      },
    );
  }
}

_initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter(DbKeys.dbSubPath);
  // await Hive.openBox<String>(DbKeys.userBox);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
}
