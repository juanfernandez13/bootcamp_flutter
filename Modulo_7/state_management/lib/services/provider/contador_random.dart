import 'package:flutter/material.dart';
import 'dart:math';
class ContadorRandom extends ChangeNotifier {
  int _contador = 0;

  void gerarRandom() {
    _contador = Random().nextInt(1000);
    notifyListeners();
  }

  int get contador => _contador;
}
