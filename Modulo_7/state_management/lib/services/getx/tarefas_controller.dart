import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/models/tarefa_model.dart';

class TarefaController extends GetxController {
  RxList<Tarefa> _listTarefas = <Tarefa>[].obs;
  RxBool _apenasNaoConcluidos = RxBool(false);

  get apenasNaoConcluidos => _apenasNaoConcluidos;
  set apenasNaoConcluidos(value) => _apenasNaoConcluidos.value = value;
  get listTarefas => _apenasNaoConcluidos.value
      ? _listTarefas.where((element) => !element.concluido).toList().obs
      : _listTarefas.toList().obs;

  adicionar(String descricao) {
    _listTarefas.add(Tarefa(descricao, false));
  }

  alterar(String id, String descricao, bool concluido) {
    var tarefa = _listTarefas.firstWhere(((element) => element.id == id));
    tarefa.concluido = concluido;
    tarefa.descricao = descricao;
    _listTarefas.refresh();
  }

  excluir(String id) {
    _listTarefas.removeWhere(((element) => element.id == id));
  }
}
