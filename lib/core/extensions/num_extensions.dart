import 'dart:math';

extension NumExtensions on num {
  // Convert number to string with commas
  String toCommaString([int fractionDigits = 0]) {
    return toStringAsFixed(fractionDigits).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  // Convert number to string with commas and currency symbol in indian style
  String toCurrencyString([int fractionDigits = 0]) {
    return '₹ ${toCommaString(fractionDigits)}';
  }

  // Convert number to string with commas and eg. ₹ 1,23,343.00
  String toCurrencyStringWithSymbol([int fractionDigits = 0]) {
    return '₹ ${toCommaString(fractionDigits)}.00';
  }

  double get toRadian => this * (180 / pi);

  String get toThousandsAndMillions {
    String val = toStringAsFixed(0);
    if (this >= 1.0e12) {
      val = '${(this / 1.0e12).toStringAsFixed(1)}T';
    } else if (this >= 1.0e9) {
      val = '${(this / 1.0e9).toStringAsFixed(1)}B';
    } else if (this >= 1.0e6) {
      val = '${(this / 1.0e6).toStringAsFixed(1)}M';
    } else if (this >= 1.0e3) {
      val = '${(this / 1.0e3).toStringAsFixed(1)}k';
    } else {
      val = toStringAsFixed(0);
    }
    return val;
  }
}
