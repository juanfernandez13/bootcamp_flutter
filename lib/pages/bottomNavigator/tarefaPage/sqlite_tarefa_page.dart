import 'package:flutter/material.dart';
import 'package:trilhaapp/model/hive_tarefa.dart';
import 'package:trilhaapp/model/sqlite_tarefas_model.dart';
import 'package:trilhaapp/repositories/hive_tarefa_repository.dart';
import 'package:trilhaapp/repositories/sqlite/sqlite_tarefas_repository.dart';

class SQLTarefasPage extends StatefulWidget {
  const SQLTarefasPage({super.key});

  @override
  State<SQLTarefasPage> createState() => _SQLTarefasPageState();
}

class _SQLTarefasPageState extends State<SQLTarefasPage> {
  TextEditingController descricaoController = TextEditingController();
  SQLiteTarefasRepository tarefaRepository = new SQLiteTarefasRepository();
  var _tarefas = <TarefasSqliteModel>[];
  bool apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.obterDados(apenasNaoConcluidos);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(
                  children: [
                    const Text("Apenas não concluidos "),
                    Switch(
                        value: apenasNaoConcluidos,
                        onChanged: ((bool value) {
                          apenasNaoConcluidos = value;
                          obterTarefas();
                        }))
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      onDismissed: (DismissDirection direction) async {
                        await tarefaRepository.delete((_tarefas[index]));
                        obterTarefas();
                        setState(() {});
                      },
                      key: Key(_tarefas[index].descricao),
                      child: ListTile(
                        title: Text(_tarefas[index].descricao),
                        trailing: Switch(
                          onChanged: (bool value) async {
                            _tarefas[index].concluido = value;
                            await tarefaRepository.update(_tarefas[index]);
                            setState(() {});
                          },
                          value: _tarefas[index].concluido,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: (() => Navigator.pop(context)),
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: (() {
                            tarefaRepository.salvar(TarefasSqliteModel(0,
                                descricaoController.text, false));
                            Navigator.pop(context);
                            setState(() {
                              obterTarefas();
                            });
                          }),
                          child: const Text("Salvar")),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
