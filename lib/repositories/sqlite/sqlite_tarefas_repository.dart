import 'package:trilhaapp/model/sqlite_tarefas_model.dart';
import 'package:trilhaapp/repositories/sqlite/database.dart';

class SQLiteTarefasRepository {

  Future<List<TarefasSqliteModel>> obterDados(bool apenasNaoConcluidos) async {
    List<TarefasSqliteModel> tarefas = [];
    var db = await SQLiteDatabase().obterDatabase();
    var result =
        await db.rawQuery(apenasNaoConcluidos  ?'SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0' 
        : 'SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      tarefas.add(TarefasSqliteModel(int.parse(element['id'].toString()),
          element['descricao'].toString(), element['concluido'] == 1));
    }
    return tarefas;
  }

  Future<void> salvar(TarefasSqliteModel tarefasSqliteModel) async {
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)',
        [tarefasSqliteModel.descricao, tarefasSqliteModel.concluido]);
  }

  Future<void> update(TarefasSqliteModel tarefasSqliteModel) async {
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawInsert('UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?',
        [tarefasSqliteModel.descricao, tarefasSqliteModel.concluido ? 1 : 0, tarefasSqliteModel.id]);
  }

  Future<void> delete(TarefasSqliteModel tarefasSqliteModel) async {
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawInsert('DELETE FROM tarefas WHERE id = ?',
        [tarefasSqliteModel.id]);
  }
}
