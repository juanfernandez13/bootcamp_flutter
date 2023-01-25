import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);

  get id => _id;
  get descricao => _descricao;
  set descricao(descricao) => _descricao = descricao;
  get concluido => _concluido;
  set concluido(concluido) => _concluido = concluido;
}
