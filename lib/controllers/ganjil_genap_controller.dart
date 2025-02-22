import 'package:flutter/material.dart';

class GanjilGenapController {
  final TextEditingController ganjilGenapC = TextEditingController();
  String hasil = "";
  void checkGanjilGenap(String value) {

    if (value.contains(RegExp(r'[^\d-]')) || value.contains(',') || value.contains(' ')) {
      hasil = 'tidak valid';
      return;
    }
    int number = int.tryParse(value) ?? 0;
    hasil = (number % 2 == 0) ? 'Genap' : 'Ganjil';
  }
}
