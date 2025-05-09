import 'package:flutter/material.dart';

class TextThemeWidget extends StatelessWidget {
  static const routeName = 'textThemeWidget';
  static const path = '/text-theme';
  const TextThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Text("displayLarge", style: textTheme.displayLarge),
          Text("displayMedium", style: textTheme.displayMedium),
          Text("displaySmall", style: textTheme.displaySmall),
          Text("headlineLarge", style: textTheme.headlineLarge),
          Text("headlineMedium", style: textTheme.headlineMedium),
          Text("headlineSmall", style: textTheme.headlineSmall),
          // Text("headline1", style: textTheme.headline1),
          // Text("headline2", style: textTheme.headline2),
          // Text("headline3", style: textTheme.headline3),
          // Text("headline4", style: textTheme.headline4),
          Text("titleLarge", style: textTheme.titleLarge),
          Text("titleMedium", style: textTheme.titleMedium),
          Text("titleSmall", style: textTheme.titleSmall),
          Text("labelLarge", style: textTheme.labelLarge),
          Text("labelMedium", style: textTheme.labelMedium),
          Text("labelSmall", style: textTheme.labelSmall),
          Text("bodyLarge", style: textTheme.bodyLarge),
          Text("bodyMedium", style: textTheme.bodyMedium),
          Text("bodySmall", style: textTheme.bodySmall),
        ]),
      ),
    );
  }
}
