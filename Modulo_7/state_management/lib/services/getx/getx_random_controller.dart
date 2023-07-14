import 'dart:math';

import 'package:get/get.dart';

class GetxRandom extends GetxController {
  var _random = 0.obs;
  get random => _random;
  void gerarRandom() => _random.value = Random().nextInt(1000);
}
