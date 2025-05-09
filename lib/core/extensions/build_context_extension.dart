import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

extension BuildContextExtension on BuildContext {
  /// # Custom App Theme Colors
  /// - It returns custom colorScheme based on the app brightness
  /// - We will use this colorPallates throught our app
  AppColor get appColor {
    if (Theme.of(this).brightness == Brightness.dark) {
      return AppColor.dark;
    } else {
      return AppColor.light;
    }
  }
}
