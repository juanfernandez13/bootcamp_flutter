import 'package:flutter/material.dart';
import 'package:trilhaapp/model/hive/tarefas_back4app_model.dart';
import 'package:trilhaapp/repositories/back4app/back4app_tarefas.dart';

class Back4AppTarefasPage extends StatefulWidget {
  const Back4AppTarefasPage({super.key});

  @override
  State<Back4AppTarefasPage> createState() => _Back4AppTarefasPageState();
}

class _Back4AppTarefasPageState extends State<Back4AppTarefasPage> {
  TextEditingController descricaoController = TextEditingController();
  TarefasBack4AppRepository tarefasRepository = TarefasBack4AppRepository();
  var _tarefasBack4App = TarefasBack4AppModel([]);
  bool apenasNaoConcluidos = false;
  bool carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() => carregando = true);
    _tarefasBack4App =
        await tarefasRepository.obterTarefas(apenasNaoConcluidos);
    carregando = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dio Back4App"),
        ),
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
                          setState(() => apenasNaoConcluidos = value);
                          obterTarefas();
                        }))
                  ],
                ),
              ),
              carregando
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _tarefasBack4App.results.length,
                        itemBuilder: ((context, index) {
                          var tarefaBack4App = _tarefasBack4App.results[index];

                          return Dismissible(
                            onDismissed: (DismissDirection direction) async {
                              tarefasRepository.deletarTarefa(tarefaBack4App);
                              obterTarefas();
                              setState(() {});
                            },
                            key: Key(tarefaBack4App.descricao),
                            child: ListTile(
                              title: Text(tarefaBack4App.descricao),
                              trailing: Switch(
                                onChanged: (bool value) async {
                                  tarefaBack4App.concluido = value;
                                  await tarefasRepository
                                      .atualizarTarefa(tarefaBack4App);
                                  setState(() {});
                                },
                                value: tarefaBack4App.concluido,
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
                            tarefasRepository.criarTarefa(
                                Tarefa.criar(descricaoController.text, false));
                            Navigator.pop(context);
                              obterTarefas();
                            setState(() {});
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
