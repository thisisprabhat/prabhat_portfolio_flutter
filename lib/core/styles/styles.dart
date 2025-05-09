import 'package:flutter/material.dart';

//! Gap Values
const double gapDefault = 16;
const double gapQuater = 4;
const double gapHalf = 8;
const double gapDouble = 32;

//! Padding
const EdgeInsets paddingDefault = EdgeInsets.all(gapDefault);
const EdgeInsets paddingMedium = EdgeInsets.all(gapHalf);
const EdgeInsets paddingSmall = EdgeInsets.all(gapQuater);
const EdgeInsets paddingZero = EdgeInsets.zero;

//! BorderRadius
final BorderRadius borderRadiusDefault = BorderRadius.circular(12);
final BorderRadius borderRadiusLarge = BorderRadius.circular(30);
final BorderRadius borderRadiusMedium = BorderRadius.circular(8);
final BorderRadius borderRadiusSmall = BorderRadius.circular(5);

//! SizedBox
const heightSizedBoxLarge = SizedBox(height: gapDouble);
const heightSizedBoxDefault = SizedBox(height: gapDefault);
const heightSizedBoxMedium = SizedBox(height: gapHalf);
const heightSizedBoxSmall = SizedBox(height: gapQuater);

const widthSizedBoxLarge = SizedBox(width: gapDouble);
const widthSizedBoxDefault = SizedBox(width: gapDefault);
const widthSizedBoxMedium = SizedBox(width: gapHalf);
const widthSizedBoxSmall = SizedBox(width: gapQuater);

const zeroSizedBox = SizedBox.shrink();

//! Durations
const Duration durationGraph = Duration(milliseconds: 2000);
const Duration durationIdealWait = Duration(milliseconds: 500);
const Duration durationAnimateTo = Duration(milliseconds: 300);
const Duration durationAnimateHide = Duration(milliseconds: 400);
const Duration durationLoading = Duration(milliseconds: 400);

//! Curves
const Curve curveDefault = Curves.decelerate;

//! ContainerDecoration
BoxDecoration boxDecorationDefault(context) {
  return BoxDecoration(
    borderRadius: borderRadiusDefault,
    color: Theme.of(context).colorScheme.surface,
  );
}

BoxDecoration boxDecorationWithShadows(context) {
  return BoxDecoration(
    borderRadius: borderRadiusDefault,
    color: Theme.of(context).colorScheme.surface,
    boxShadow: const [
      BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(1, 2)),
    ],
  );
}

const boxShadowDefault = [
  BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(1, 2)),
];

//! Shadows

const shadowLight = [
  BoxShadow(blurRadius: 2, color: Colors.black12, offset: Offset(1, 2)),
];
const shadowDefault = [
  BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(1, 2)),
];
const shadowLarge = [
  BoxShadow(
    color: Colors.black26,
    spreadRadius: 0,
    blurRadius: 15,
    offset: Offset(0, 0),
  ),
];

//! Gradient

LinearGradient shimmerGradient(Brightness brightness) {
  final gradient =
      brightness == Brightness.dark
          ? shimmerGradientDark
          : shimmerGradientLight;
  return gradient;
}

const shimmerGradientLight = LinearGradient(
  colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
const shimmerGradientDark = LinearGradient(
  colors: [Color(0xFF1C1C1C), Color(0xFF2C2C2C), Color(0xFF1C1C1C)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

//! Map Styles
/// Open street map light and dark mode themes
Widget mapThemeTileBuilder(BuildContext context, Widget tileWidget, tile) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return ColorFiltered(
    colorFilter:
        isDarkMode
            ? const ColorFilter.matrix(<double>[
              -0.2126, -0.7152, -0.0722, 0, 255, // Dark mode filter
              -0.2126, -0.7152, -0.0722, 0, 255,
              -0.2126, -0.7152, -0.0722, 0, 255,
              0, 0, 0, 1, 0,
            ])
            : const ColorFilter.matrix(<double>[
              0.33, 0.59, 0.11, 0, 0, // Grayscale filter for light mode
              0.33, 0.59, 0.11, 0, 0,
              0.33, 0.59, 0.11, 0, 0,
              0, 0, 0, 1, 0,
            ]),
    child: tileWidget,
  );
}
