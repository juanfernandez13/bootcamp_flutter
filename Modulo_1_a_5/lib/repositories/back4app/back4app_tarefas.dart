import 'package:dio/dio.dart';
import 'package:trilhaapp/model/hive/tarefas_back4app_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilhaapp/repositories/back4app/back4app_custon_dio.dart';

class TarefasBack4AppRepository {
  final _custonDio = Back4AppCustonDio();

  TarefasBack4AppRepository();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidos) async {
    var query = naoConcluidos ? "?where={\"concluido\":true}" : "";
    var result = await _custonDio.dio.get("/Tarefas$query");
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criarTarefa(Tarefa tarefa) async {
    try {
      var response = await _custonDio.dio.post("/Tarefas", data: tarefa.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizarTarefa(Tarefa tarefa) async {
    try {
      var response = await _custonDio.dio.put("/Tarefas/${tarefa.objectId}", data: tarefa.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }
  Future<void> deletarTarefa(Tarefa tarefa) async {
    try {
      var response = await _custonDio.dio.delete("/Tarefas/${tarefa.objectId}");
    } catch (e) {
      throw e;
    }
  }
}
