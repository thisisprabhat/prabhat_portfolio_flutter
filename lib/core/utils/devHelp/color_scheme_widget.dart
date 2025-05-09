import 'package:flutter/material.dart';
import 'package:prabhat_portfolio_flutter/core/extensions/build_context_extension.dart';
import 'package:prabhat_portfolio_flutter/core/extensions/color_extensions.dart';
import 'package:prabhat_portfolio_flutter/core/styles/app_colors.dart';

class ColorSchemeWidget extends StatelessWidget {
  static const routeName = 'colorSchemeWidget';
  static const path = '/color-scheme';
  const ColorSchemeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.appColor.theme.colorScheme;
    List<Color> themeColors = [
      colorScheme.primary,
      colorScheme.onPrimary,
      colorScheme.primaryContainer,
      colorScheme.secondary,
      colorScheme.onSecondary,
      colorScheme.secondaryContainer,
      colorScheme.surface,
      colorScheme.onSurface,
      colorScheme.onSurfaceVariant,
      colorScheme.surfaceTint,
      colorScheme.error,
      colorScheme.onError,
      colorScheme.outline,
    ];
    List themeColorsNames = [
      "primary",
      "onPrimary",
      "primaryContainer",
      "secondary",
      "onSecondary",
      "secondaryContainer",
      "surface",
      "onSurface",
      "onSurfaceVariant",
      "surfaceTint",
      "error",
      "onError",
      "outline",
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemCount: themeColors.length,
      itemBuilder: (context, index) {
        return Container(
          color: themeColors[index],
          child: Center(
            child: Container(
              color: colorScheme.surface,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    themeColors[index].toHex ?? '',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  Text(
                    themeColorsNames[index].toString(),
                    style: TextStyle(color: colorScheme.primary),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
