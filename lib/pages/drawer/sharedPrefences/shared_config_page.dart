import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/services/app_storage.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  
  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacao = false;
  bool temaEscuro = false;

  AppStorage storage = AppStorage();
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
      nomeController.text = await storage.getUsuario();
      alturaController.text = (await (storage.getAltura())).toString();
      temaEscuro = await storage.getTemaEscuro();
      receberNotificacao = await storage.getReceberNotificacao();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text("Configurações")),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration:
                      const InputDecoration(hintText: "Nome do usuário"),
                  controller: nomeController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  decoration:
                      const InputDecoration(hintText: "Altura do usuário"),
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SwitchListTile(
                  title: const Text("Receber notificações"),
                  value: receberNotificacao,
                  onChanged: ((bool value) {
                    setState(() => receberNotificacao = value);
                  })),
              SwitchListTile(
                  title: const Text("Tema escuro"),
                  value: temaEscuro,
                  onChanged: ((bool value) {
                    setState(() => temaEscuro = value);
                  })),
              TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      await storage.setAltura(double.parse(alturaController.text));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Meu App"),
                              content: const Text(
                                  "Por favor, digitar um valor válido"),
                              actions: [
                                TextButton(
                                    onPressed: (() {
                                      alturaController.text = "";
                                      Navigator.pop(_);
                                    }),
                                    child: const Text("Ok"))
                              ],
                            );
                          });
                      return;
                    }
                    await storage.setUsuario(nomeController.text);
                    await storage.setReceberNotificacao(receberNotificacao);
                    await storage.setTemaEscuro(temaEscuro);

                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          )),
    );
  }
}
