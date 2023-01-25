import 'package:flutter/material.dart';
import 'package:trilhaapp/model/hive_tarefa.dart';
import 'package:trilhaapp/repositories/hive_tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  TextEditingController descricaoController = TextEditingController();
  late HiveTarefaRepository tarefaRepository;
  var _tarefas = <HiveTarefa>[];
  bool apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    tarefaRepository = await HiveTarefaRepository.carregar();
    if (apenasNaoConcluidos) {
      _tarefas = tarefaRepository.obterDadosNaoConcluidos();
    } else {
      _tarefas = tarefaRepository.obterDados();
    }
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
                        tarefaRepository.excluir(_tarefas[index]);
                        obterTarefas();
                        setState(() {});
                      },
                      key: Key(_tarefas[index].descricao),
                      child: ListTile(
                        title: Text(_tarefas[index].descricao),
                        trailing: Switch(
                          onChanged: (bool value) {
                            _tarefas[index].concluido = value;
                            tarefaRepository.alterar(_tarefas[index]);
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
                            tarefaRepository.salvar(HiveTarefa.criar(
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
