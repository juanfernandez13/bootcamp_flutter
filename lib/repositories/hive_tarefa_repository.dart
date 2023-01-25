import 'package:hive/hive.dart';
import '../model/hive_tarefa.dart';

class HiveTarefaRepository {
  static late Box _box;

  HiveTarefaRepository._criar();

  static Future<HiveTarefaRepository> carregar() async {
    if (Hive.isBoxOpen('tarefas')) {
      _box = Hive.box('tarefas');
    } else {
      _box = await Hive.openBox('tarefas');
    }
    return HiveTarefaRepository._criar();
  }

  salvar(HiveTarefa hiveTarefa) => _box.add(hiveTarefa);
  alterar(HiveTarefa hiveTarefa) => hiveTarefa.save();
  excluir(HiveTarefa hiveTarefa) => hiveTarefa.delete();
  List<HiveTarefa> obterDados() => _box.values.cast<HiveTarefa>().toList();
  List<HiveTarefa> obterDadosNaoConcluidos() => _box.values.cast<HiveTarefa>().where((element) => element.concluido == false).toList();
}
