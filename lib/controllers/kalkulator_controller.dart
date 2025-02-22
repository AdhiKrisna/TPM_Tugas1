import 'package:flutter/material.dart';

class KalkulatorController {
  final TextEditingController angka1C = TextEditingController();
  final TextEditingController angka2C = TextEditingController();

  double calculate(double angka1, double angka2, String operator) {
    switch (operator) {
      case '+':
        return angka1 + angka2;
      case '-':
        return angka1 - angka2;
      case '*':
        return angka1 * angka2;
      case '/':
        return angka1 / angka2;
      default:
        return 0;
    }
  }
  
}