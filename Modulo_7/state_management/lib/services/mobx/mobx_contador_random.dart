import 'package:mobx/mobx.dart';
import 'dart:math';

class ContadorMobx {
  final _random = Observable(0);
  int get random => _random.value;

  late Action gerarRandom;

  void _gerarRandom() {
    _random.value = Random().nextInt(1000);
  }

  ContadorMobx() {
    gerarRandom = Action(_gerarRandom);
  }
}
