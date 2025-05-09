import 'package:flutter/services.dart';

class DecimalRangeInputFormatter extends TextInputFormatter {
  final double maxValue;
  final int decimalPlaces;

  DecimalRangeInputFormatter({required this.maxValue, this.decimalPlaces = 2});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-digit and non-decimal point characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    // Handle cases where the user starts with a decimal point
    if (newText.startsWith('.')) {
      newText = '0.';
    }

    // Split the text into integer and decimal parts
    List<String> parts = newText.split('.');

    // Limit integer part to fit within the maxValue
    if (parts.isNotEmpty) {
      String integerPart = parts[0];
      if (integerPart.isNotEmpty) {
        double value = double.parse(integerPart);
        if (value > maxValue) {
          integerPart = maxValue.toStringAsFixed(decimalPlaces);
        }
      }
      parts[0] = integerPart;
    }

    // Limit decimal places
    if (parts.length > 1) {
      String decimalPart = parts[1].substring(0, decimalPlaces);
      parts[1] = decimalPart;
    }

    // Join the parts back together
    newText = parts.join('.');

    // Return the updated value
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
