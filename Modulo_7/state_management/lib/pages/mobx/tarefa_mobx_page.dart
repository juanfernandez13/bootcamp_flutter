import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/services/lista_tarefa_mobx.dart';

class TarefaMobxPage extends StatefulWidget {
  @override
  State<TarefaMobxPage> createState() => _TarefaMobxPageState();
}

class _TarefaMobxPageState extends State<TarefaMobxPage> {
  var descricaoContoller = TextEditingController();
  var tarefasStore = ListaTarefasStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoContoller.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: descricaoContoller,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            tarefasStore.add(descricaoContoller.text);
                            Navigator.pop(context);
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                "Tarefas Mobx Store",
                style: TextStyle(fontSize: 26),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluídos",
                      style: TextStyle(fontSize: 18),
                    ),
                    Observer(builder: (context) {
                      return Switch(
                          value: tarefasStore.apenasNaoConcluidos,
                          onChanged: (bool value) {
                            tarefasStore.naoConcluido = value;
                          });
                    })
                  ],
                ),
              ),
              Expanded(
                child: Observer(builder: (context) {
                  return ListView.builder(
                      itemCount: tarefasStore.listaTarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = tarefasStore.listaTarefas[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            tarefasStore.excluir(tarefa.id);
                          },
                          key: Key(tarefa.descricao),
                          child: ListTile(
                            title: Text(tarefa.descricao),
                            trailing: Observer(builder: (context) {
                              return Switch(
                                onChanged: (bool value) async {
                                  tarefa.concluido = !tarefa.concluido;
                                  tarefasStore.alterar(tarefa.id,
                                      tarefa.descricao, tarefa.concluido);
                                },
                                value: tarefa.concluido,
                              );
                            }),
                          ),
                        );
                      });
                }),
              ),
            ],
          ),
        ));
  }
}
