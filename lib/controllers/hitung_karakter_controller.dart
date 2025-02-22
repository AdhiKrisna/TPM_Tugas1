
import 'package:flutter/material.dart';

class HitungKarakterController {
  final TextEditingController hitungKarakterC = TextEditingController();
  String hasil = "";
  void checkKarakter(String value) {
    if (value.contains(RegExp(r'[0-9]')) || value.contains(RegExp(r'[A-Z]')) || value.contains(RegExp(r'[a-z]'))) {
      hasil = 'Panjang Karakter : ${value.length} karakter';
    } else {
      hasil = 'tidak valid';
      return;
    }
  }

  
}