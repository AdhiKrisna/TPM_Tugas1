import 'package:flutter/material.dart';

class HitungKarakterController {
  final TextEditingController hitungKarakterC = TextEditingController();
  String hasil = "";
  void checkKarakter(String value) {
    hasil = value.replaceAll(' ', '').length.toString();
  }
}