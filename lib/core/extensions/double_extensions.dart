import 'package:flutter/widgets.dart';

extension DoubleExtensions on double {
  SizedBox get toHeight => SizedBox(height: this);
  SizedBox get toWidth => SizedBox(width: this);
}
