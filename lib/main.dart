import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
import 'package:trilhaapp/model/hive/dados_cadastrais_model.dart';
import 'package:trilhaapp/model/hive/hive_tarefa.dart';
import 'my_app.dart';





void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDiractory = await path_provider.getApplicationSupportDirectory();
  Hive.init(documentsDiractory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(HiveTarefaAdapter());
  runApp(const MyApp());
}
