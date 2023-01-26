import 'package:hive/hive.dart';
part 'hive_tarefa.g.dart';

@HiveType(typeId: 1)
class HiveTarefa extends HiveObject {
  @HiveField(0)
  String descricao = "";
  @HiveField(1)
  bool concluido = false;

  HiveTarefa();
  HiveTarefa.criar(this.descricao,this.concluido);

}
