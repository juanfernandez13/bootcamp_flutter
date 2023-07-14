import 'dart:math';
import 'package:mobx/mobx.dart';

part 'store_mobx_contador.g.dart';

class StoreMobxService = _StoreMobxService with _$StoreMobxService;

abstract class _StoreMobxService with Store {
  @observable
  int _random = 0;
  int get random => _random;

  @action
  void gerarRandom() {
    _random = Random().nextInt(1000);
  }
}
