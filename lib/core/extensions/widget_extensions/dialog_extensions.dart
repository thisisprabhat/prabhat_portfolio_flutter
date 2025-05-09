import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

extension DialogExtension on Widget {
  showDialog(context) {
    showModal(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(
        barrierDismissible: true,
        barrierColor: Colors.black38,
        barrierLabel: 'Dialog',
        transitionDuration: Duration(milliseconds: 800),
        reverseTransitionDuration: Duration(milliseconds: 500),
      ),
      builder: (context) => this,
    );
  }
}
