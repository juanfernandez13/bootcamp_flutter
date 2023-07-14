import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/getx/tarefas_controller.dart';

class TarefaGetxPage extends StatefulWidget {
  @override
  State<TarefaGetxPage> createState() => _TarefaGetxPageState();
}

class _TarefaGetxPageState extends State<TarefaGetxPage> {
  var descricaoContoller = TextEditingController();
  var getxTarefaController = TarefaController();

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
                                getxTarefaController.adicionar(descricaoContoller.text);
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
                "Tarefas Getx Store",
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
                         Obx(
                           () {
                             return Switch(
                                  value: getxTarefaController.apenasNaoConcluidos.value,
                                  onChanged: (value) {
                                    getxTarefaController.apenasNaoConcluidos = value;
                                  });
                           }
                         )
                      ],
                   
                ),
              ),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      itemCount: getxTarefaController.listTarefas.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = getxTarefaController.listTarefas[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            getxTarefaController.excluir(tarefa.id);
                          },
                          key: Key(tarefa.descricao),
                          child: ListTile(
                            title: Text(tarefa.descricao),
                            trailing: Switch(
                                onChanged: (bool value) async {
                                  tarefa.concluido = !tarefa.concluido;
                                  getxTarefaController.alterar(tarefa.id,
                                      tarefa.descricao, tarefa.concluido);
                                },
                                value: tarefa.concluido,
                              ),
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
