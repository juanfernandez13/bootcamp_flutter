import 'package:trilhaapp/model/tarefa.dart';

class TarefaRepository {
  List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
    Future.delayed(const Duration(milliseconds: 100));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    Future.delayed(const Duration(milliseconds: 100));
    _tarefas
        .where((element) => element.id == id)
        .first
        .concluido = concluido;
  }

  Future<void> remove(String id) async {
    Future.delayed(const Duration(milliseconds: 100));
    _tarefas.remove(_tarefas
        .where((element) => element.id == id)
        .first);
  }

  Future<List<Tarefa>> listarNaoConcluidas() async {
    Future.delayed(const Duration(milliseconds: 100));
    return _tarefas
        .where((element) => element.concluido == false)
        .toList();
  }

  Future<List<Tarefa>> listar() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tarefas;
  }
}
