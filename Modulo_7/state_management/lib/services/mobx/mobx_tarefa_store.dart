import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'mobx_tarefa_store.g.dart';

class TarefaMobxStore = _TarefaMobxStore with _$TarefaMobxStore;

abstract class _TarefaMobxStore with Store {
  @observable
  String _id = UniqueKey().toString();

  @observable
  String _descricao = "";

  @observable
  bool _concluido = false;

  String get id => _id;
  String get descricao => _descricao;
  bool get concluido => _concluido;

  _TarefaMobxStore(this._descricao, this._concluido);
  
  set concluido(bool value) => _concluido = value;

  @action
  alterar(String descricao, bool concluido) {
    _descricao = descricao;
    _concluido = concluido;
  }
}
