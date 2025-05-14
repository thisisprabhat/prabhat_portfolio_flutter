import 'package:flutter/material.dart';

abstract class ThemeStyle {
  InputDecoration getInputDecoration(String hintText);
}

class LightThemeStyle implements ThemeStyle {
  @override
  InputDecoration getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black54),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }
}

class DarkThemeStyle implements ThemeStyle {
  @override
  InputDecoration getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }
}

abstract class PlatformStyle {
  TextStyle getTextStyle();
}

class AndroidPlatformStyle implements PlatformStyle {
  @override
  TextStyle getTextStyle() {
    return const TextStyle(fontFamily: 'Roboto', fontSize: 16);
  }
}

class IOSPlatformStyle implements PlatformStyle {
  @override
  TextStyle getTextStyle() {
    return const TextStyle(fontFamily: 'SanFrancisco', fontSize: 16);
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ThemeStyle themeStyle;
  final PlatformStyle platformStyle;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.themeStyle,
    required this.platformStyle,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: platformStyle.getTextStyle(),
      decoration: themeStyle.getInputDecoration(hintText),
    );
  }
}
