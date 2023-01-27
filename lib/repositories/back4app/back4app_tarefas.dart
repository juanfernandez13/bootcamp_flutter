import 'package:dio/dio.dart';
import 'package:trilhaapp/model/hive/tarefas_back4app_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TarefasBack4AppRepository {
  final _dio = Dio();

  TarefasBack4AppRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get("XPARSEAPPLICATIONID");
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.get("XPARSERESTAPIKEY");
    _dio.options.headers["Content-Type"] = dotenv.get("CONTENTTYPE");
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes/Tarefas';
  }

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidos) async {
    var query = naoConcluidos ? "?where={\"concluido\":true}" : "";
    var result = await _dio.get(query);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criarTarefa(Tarefa tarefa) async {
    try {
      var response = await _dio.post("", data: tarefa.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizarTarefa(Tarefa tarefa) async {
    try {
      var response = await _dio.put("/${tarefa.objectId}", data: tarefa.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }
  Future<void> deletarTarefa(Tarefa tarefa) async {
    try {
      var response = await _dio.delete("/${tarefa.objectId}");
    } catch (e) {
      throw e;
    }
  }
}
