import 'package:firebase_app/models/tarefa_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  final db = FirebaseFirestore.instance;
  TextEditingController descricaoController = TextEditingController();
  TextEditingController descricaoEditandoController = TextEditingController();
  bool apenasNaoConcluido = false;
  String userID = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarUsuario();
  }

  carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString('user_id')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Firebase Tarefas"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Apenas não concluídos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Switch(
                    value: apenasNaoConcluido,
                    onChanged: (bool value) {
                      setState(() {
                        apenasNaoConcluido = value;
                      });
                    }),
              ],
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
              stream: apenasNaoConcluido
                  ? db
                      .collection("tarefas")
                      .where('concluido', isEqualTo: false)
                      .where('user_id', isEqualTo: userID)
                      .snapshots()
                  : db
                      .collection("tarefas")
                      .where('user_id', isEqualTo: userID)
                      .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        children: snapshot.data!.docs.map((e) {
                          return Dismissible(
                            onDismissed:
                                (DismissDirection dismissDirection) async {
                              await db.collection("tarefas").doc(e.id).delete();
                            },
                            key: Key(e.id),
                            child: ListTile(
                              title: Text(e["descricao"]),
                              leading: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext bc) {
                                        descricaoEditandoController.text =
                                            e["descricao"];
                                        return AlertDialog(
                                          title: const Text("Editar Tarefa"),
                                          content: TextField(
                                            controller:
                                                descricaoEditandoController,
                                          ),
                                          actions: [
                                            TextButton(
                                                style: const ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.white),
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.blueAccent)),
                                                onPressed: () async {
                                                  await db
                                                      .collection("tarefas")
                                                      .doc(e.id)
                                                      .update({
                                                    'descricao':
                                                        descricaoEditandoController
                                                            .text
                                                            .trim(),
                                                    'data_alteracao':
                                                        DateTime.now()
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Salvar")),
                                            TextButton(
                                                style: ButtonStyle(
                                                    overlayColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.red[200]),
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            side: const BorderSide(
                                                                color: Colors
                                                                    .redAccent,
                                                                width: 1,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)))),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Cancelar",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ))
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(Icons.edit_note),
                              ),
                              trailing: Switch(
                                value: e["concluido"],
                                onChanged: (bool value) async {
                                  await db
                                      .collection("tarefas")
                                      .doc(e.id)
                                      .update({
                                    "concluido": value,
                                    'data_alteracao': DateTime.now()
                                  });
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
              },
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  descricaoController.text = "";
                  return AlertDialog(
                    title: const Text("Adicionar Tarefa"),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                          style: const ButtonStyle(
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blueAccent)),
                          onPressed: () async {
                            var tarefa = TarefaModel(
                                descricao: descricaoController.text,
                                concluido: false,
                                userId: userID);
                            await db.collection("tarefas").add(tarefa.toJson());
                            Navigator.pop(context);
                          },
                          child: const Text("Adicionar")),
                      TextButton(
                          style: ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.red[200]),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.redAccent,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w600),
                          ))
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
