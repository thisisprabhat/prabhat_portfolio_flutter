import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      a.floor(),
      (r * value).round(),
      (g * value).round(),
      (b * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      a.floor(),
      (r + ((255 - r) * value)).round(),
      (g + ((255 - g) * value)).round(),
      (b + ((255 - b) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (r + other.r) ~/ 2;
    final green = (g + other.g) ~/ 2;
    final blue = (b + other.b) ~/ 2;
    final alpha = (a + other.a) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color get accentColor =>
      (b / 2 >= 255 / 2 || r / 2 >= 255 / 2 || g / 2 >= 255 / 2)
          ? Colors.black87
          : Colors.white70;

  /// Convert the color to a hex string
  String? get toHex {
    try {
      final hexString = '#${a.floor().toRadixString(16).padLeft(2, '0')}'
          '${r.floor().toRadixString(16).padLeft(2, '0')}'
          '${g.floor().toRadixString(16).padLeft(2, '0')}'
          '${b.floor().toRadixString(16).padLeft(2, '0')}';

      return hexString;
    } catch (e) {
      return null;
    }
  }
}
