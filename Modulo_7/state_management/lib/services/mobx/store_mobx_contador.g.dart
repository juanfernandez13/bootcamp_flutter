// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_mobx_contador.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreMobxService on _StoreMobxService, Store {
  late final _$_randomAtom =
      Atom(name: '_StoreMobxService._random', context: context);

  @override
  int get _random {
    _$_randomAtom.reportRead();
    return super._random;
  }

  @override
  set _random(int value) {
    _$_randomAtom.reportWrite(value, super._random, () {
      super._random = value;
    });
  }

  late final _$_StoreMobxServiceActionController =
      ActionController(name: '_StoreMobxService', context: context);

  @override
  void gerarRandom() {
    final _$actionInfo = _$_StoreMobxServiceActionController.startAction(
        name: '_StoreMobxService.gerarRandom');
    try {
      return super.gerarRandom();
    } finally {
      _$_StoreMobxServiceActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
