// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_tarefa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefaMobxStore on _TarefaMobxStore, Store {
  late final _$_idAtom = Atom(name: '_TarefaMobxStore._id', context: context);

  @override
  String get _id {
    _$_idAtom.reportRead();
    return super._id;
  }

  @override
  set _id(String value) {
    _$_idAtom.reportWrite(value, super._id, () {
      super._id = value;
    });
  }

  late final _$_descricaoAtom =
      Atom(name: '_TarefaMobxStore._descricao', context: context);

  @override
  String get _descricao {
    _$_descricaoAtom.reportRead();
    return super._descricao;
  }

  @override
  set _descricao(String value) {
    _$_descricaoAtom.reportWrite(value, super._descricao, () {
      super._descricao = value;
    });
  }

  late final _$_concluidoAtom =
      Atom(name: '_TarefaMobxStore._concluido', context: context);

  @override
  bool get _concluido {
    _$_concluidoAtom.reportRead();
    return super._concluido;
  }

  @override
  set _concluido(bool value) {
    _$_concluidoAtom.reportWrite(value, super._concluido, () {
      super._concluido = value;
    });
  }

  late final _$_TarefaMobxStoreActionController =
      ActionController(name: '_TarefaMobxStore', context: context);

  @override
  dynamic alterar(String descricao, bool concluido) {
    final _$actionInfo = _$_TarefaMobxStoreActionController.startAction(
        name: '_TarefaMobxStore.alterar');
    try {
      return super.alterar(descricao, concluido);
    } finally {
      _$_TarefaMobxStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
