import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

import '../../utils/shared_prefs_helper.dart';

// import '/widgets/widgets.dart';

extension AnimationExtension on Widget {
  // Widget bounce({
  //   required VoidCallback onPressed,
  //   double scaleFactor = 1,
  //   Duration duration = const Duration(milliseconds: 200),
  //   bool canReverse = false,
  //   bool isScrollable = false,
  // }) {
  //   return CustomBounceWidget(
  //     onPressed: onPressed,
  //     scaleFactor: scaleFactor,
  //     duration: duration,
  //     canReverse: canReverse,
  //     isScrollable: isScrollable,
  //     child: this,
  //   );
  // }

  Widget toAnimation({Duration? duration, Curve? curve, index}) => animate();

  Widget animationOpacity({
    int delayInMS = 300,
    int duration = 300,
    bool animate = true,
  }) =>
      !animate || !SharedPrefsHelper.animate
          ? this
          : this
              .animate(delay: Duration(milliseconds: delayInMS))
              .fade(
                begin: 0.1,
                end: 1,
                duration: Duration(milliseconds: duration),
              );

  Widget slideUpAnimation({
    int delayInMs = 100,
    int duration = 800,
    bool animate = true,
    double? initialY,
  }) =>
      !animate || !SharedPrefsHelper.animate
          ? this
          : this.animate(
            effects: [
              SlideEffect(
                delay: Duration(milliseconds: delayInMs),
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: duration),
                begin: Offset(0, initialY ?? 1),
                end: const Offset(0, 0),
              ),
            ],
          );

  Widget slideDownAnimation({
    int? delayInML,
    int duration = 500,
    bool animate = true,
    double beginOffset = 1,
  }) =>
      !animate || !SharedPrefsHelper.animate
          ? this
          : this.animate(
            effects: [
              SlideEffect(
                delay: Duration(milliseconds: delayInML ?? 100),
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: duration),
                begin: Offset(0, -beginOffset),
                end: const Offset(0, 0),
              ),
            ],
          );

  Widget slideAnimation({
    int? delayInML,
    int duration = 500,
    bool animate = true,
    required Offset begin,
    required Offset end,
  }) =>
      !animate || !SharedPrefsHelper.animate
          ? this
          : this.animate(
            effects: [
              SlideEffect(
                delay: Duration(milliseconds: delayInML ?? 100),
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: duration),
                begin: begin,
                end: end,
              ),
            ],
          );
  Widget slideLeftAnimation({
    int? delayInML,
    int duration = 500,
    bool animate = true,
  }) =>
      !animate || !SharedPrefsHelper.animate
          ? this
          : this.animate(
            effects: [
              SlideEffect(
                delay: Duration(milliseconds: delayInML ?? 100),
                curve: Curves.linearToEaseOut,
                duration: Duration(milliseconds: duration),
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
              ),
            ],
          );
}
