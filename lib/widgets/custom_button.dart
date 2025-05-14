import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;

  const CustomButton._({
    required this.label,
    required this.onPressed,
    required this.color,
    required this.borderRadius,
    Key? key,
  }) : super(key: key);

  factory CustomButton.primary({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton._(
      label: label,
      onPressed: onPressed,
      color: Colors.blue,
      borderRadius: 8.0,
    );
  }

  factory CustomButton.secondary({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton._(
      label: label,
      onPressed: onPressed,
      color: Colors.grey,
      borderRadius: 8.0,
    );
  }

  factory CustomButton.danger({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton._(
      label: label,
      onPressed: onPressed,
      color: Colors.red,
      borderRadius: 8.0,
    );
  }

  factory CustomButton.rounded({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomButton._(
      label: label,
      onPressed: onPressed,
      color: Colors.green,
      borderRadius: 30.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(label),
    );
  }
}
