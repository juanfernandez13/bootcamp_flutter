import 'package:flutter/gestures.dart';

class TarefasSqliteModel {
  int _id = 0;
  String _descricao = "";
  bool _concluido = false;

  TarefasSqliteModel(this._id, this._descricao, this._concluido);

  get id => _id;
  set id(id) => _id = id;
  get descricao => _descricao;
  set descricao(descricao) => _descricao = descricao;
  get concluido => _concluido;
  set concluido(concluido) => _concluido = concluido;
}
