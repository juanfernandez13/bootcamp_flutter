import 'package:flutter/material.dart';
import 'package:trilhaapp/model/configuracoes_model.dart';
import 'package:trilhaapp/repositories/configuracoes_repository.dart';
import 'package:trilhaapp/services/app_storage.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  ConfiguracoesModel configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
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
                  value: configuracoesModel.receberNotificacoes,
                  onChanged: ((bool value) {
                    setState(
                        () => configuracoesModel.receberNotificacoes = value);
                  })),
              SwitchListTile(
                  title: const Text("Tema escuro"),
                  value: configuracoesModel.temaEscuro,
                  onChanged: ((bool value) {
                    setState(() => configuracoesModel.temaEscuro = value);
                  })),
              TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    try {
                      configuracoesModel.altura =
                          double.parse(alturaController.text);
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
                    configuracoesModel.nomeUsuario = nomeController.text;
                    configuracoesRepository.salvar(configuracoesModel);
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          )),
    );
  }
}
