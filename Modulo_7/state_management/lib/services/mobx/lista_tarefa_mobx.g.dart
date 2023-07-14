// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefa_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefasStore on _ListaTarefasStore, Store {
  late final _$_apenasNaoConcluidosAtom =
      Atom(name: '_ListaTarefasStore._apenasNaoConcluidos', context: context);

  @override
  bool get _apenasNaoConcluidos {
    _$_apenasNaoConcluidosAtom.reportRead();
    return super._apenasNaoConcluidos;
  }

  @override
  set _apenasNaoConcluidos(bool value) {
    _$_apenasNaoConcluidosAtom.reportWrite(value, super._apenasNaoConcluidos,
        () {
      super._apenasNaoConcluidos = value;
    });
  }

  late final _$_ListaTarefasStoreActionController =
      ActionController(name: '_ListaTarefasStore', context: context);

  @override
  void add(String description) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.add');
    try {
      return super.add(description);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterar(String id, String descricao, bool concluido) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.alterar');
    try {
      return super.alterar(id, descricao, concluido);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void excluir(String id) {
    final _$actionInfo = _$_ListaTarefasStoreActionController.startAction(
        name: '_ListaTarefasStore.excluir');
    try {
      return super.excluir(id);
    } finally {
      _$_ListaTarefasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
