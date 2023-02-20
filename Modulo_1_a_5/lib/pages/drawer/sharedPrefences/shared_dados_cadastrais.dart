import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/repositories/mockados/linguagens_repository.dart';
import 'package:trilhaapp/repositories/mockados/nivel_repository.dart';
import 'package:trilhaapp/services/app_storage.dart';
import 'package:trilhaapp/shared/widgets/text_label_cadastro.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascimentoController =
      TextEditingController(text: "");

  NivelRepository nivelRepository = NivelRepository();
  LinguagensRepository linguagemRepository = LinguagensRepository();

  var niveis = [];
  var linguagens = [];
  List<String> linguagensSelecionadas = [];
  String nivelSelecionado = "";
  double salarioEscolhido = 0;
  String tempoExperiencia = "";

  bool salvando = false;

  AppStorage storage = AppStorage();

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagemRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    dataNascimentoController.text = await storage.getDataDeNascimento();
    nomeController.text = await storage.getNome();
    tempoExperiencia = await storage.getTempoExperiencia();
    nivelSelecionado = await storage.getNivelExperiencia();
    salarioEscolhido = await storage.getSalario();
    linguagensSelecionadas = await storage.getLinguagens();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Meus dados"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: salvando == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      const TextLabelCadastro(texto: "Nome"),
                      TextField(
                        controller: nomeController,
                      ),
                      const SizedBox(height: 15),
                      const TextLabelCadastro(texto: "Data de nascimento"),
                      TextField(
                        controller: dataNascimentoController,
                        readOnly: true,
                        onTap: (() async {
                          var data = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000, 1, 1),
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime(2023, 1, 15));
                          if (data != null) {
                            dataNascimentoController.text = data.toString();
                          }
                        }),
                      ),
                      const SizedBox(height: 15),
                      const TextLabelCadastro(texto: 'Nível de experiência'),
                      Column(
                          children: niveis
                              .map((nivel) => RadioListTile(
                                  title: Text(nivel),
                                  dense: true,
                                  selected: nivelSelecionado == nivel,
                                  value: nivel.toString(),
                                  groupValue: nivelSelecionado,
                                  onChanged: ((value) {
                                    setState(() =>
                                        nivelSelecionado = value.toString());
                                  })))
                              .toList()),
                      const TextLabelCadastro(texto: 'Linguagens preferidas'),
                      Column(
                          children: linguagens
                              .map(
                                (linguagem) => CheckboxListTile(
                                    title: Text(linguagem),
                                    dense: true,
                                    value: linguagensSelecionadas
                                        .contains(linguagem),
                                    onChanged: ((value) {
                                      if (value == true) {
                                        setState(() => linguagensSelecionadas
                                            .add(linguagem));
                                      } else {
                                        setState(() => linguagensSelecionadas
                                            .remove(linguagem));
                                      }
                                      debugPrint(
                                          linguagensSelecionadas.toString());
                                    })),
                              )
                              .toList()),
                      const TextLabelCadastro(texto: "Tempo de experiância"),
                      const SizedBox(height: 10),
                      DropdownButton(
                          isExpanded: true,
                          value: tempoExperiencia,
                          items: const [
                            DropdownMenuItem(
                              value: "",
                              child: Text("Selecione uma opção"),
                            ),
                            DropdownMenuItem(
                              value: "Sem experiência",
                              child: Text("Sem experiência"),
                            ),
                            DropdownMenuItem(
                              value: "Menos de 1 ano",
                              child: Text("Menos de 1 ano"),
                            ),
                            DropdownMenuItem(
                              value: "1 a 3 anos",
                              child: Text("1 a 3 anos"),
                            ),
                            DropdownMenuItem(
                              value: "3 a 6 anos",
                              child: Text("3 a 6 anos"),
                            ),
                            DropdownMenuItem(
                              value: "6 a 10 anos",
                              child: Text("6 a 10 anos"),
                            ),
                            DropdownMenuItem(
                              value: "+ de 10 anos",
                              child: Text("+ de 10 anos"),
                            ),
                          ],
                          onChanged: ((String? value) {
                            setState(() {
                              tempoExperiencia = value!;
                            });
                          })),
                      const SizedBox(height: 15),
                      TextLabelCadastro(
                          texto:
                              "Pretenção Salarial R\$ ${salarioEscolhido.round().toString()}"),
                      const SizedBox(height: 5),
                      Slider(
                          min: 0,
                          max: 10000,
                          value: salarioEscolhido,
                          label: salarioEscolhido.round().toString(),
                          onChanged: ((value) {
                            setState(() => salarioEscolhido = value);
                          })),
                      TextButton(
                          onPressed: () async {
                            if (nomeController.text.trim().length < 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("O nome deve ser preenchido")));
                              return;
                            }
                            if (dataNascimentoController.text == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Data de nascimento inválida")));
                              return;
                            }
                            if (nivelSelecionado == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Selecione um nivel de experiência")));
                              return;
                            }
                            if (linguagensSelecionadas.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Selecione uma linguagem")));
                              return;
                            }
                            if (tempoExperiencia == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Selecione um tempo de experiência")));
                              return;
                            }
                            if (salarioEscolhido < 1200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "O salario deve ser maior que 1200")));
                              return;
                            }
                            await storage.setNome(nomeController.text);
                            await storage.setDataDeNascimento(DateTime.parse(dataNascimentoController.text));
                            await storage.setNivelExperiencia(nivelSelecionado);
                            await storage.setLinguagens(linguagensSelecionadas);
                            await storage.setSalario(salarioEscolhido);
                            await storage.setTempoExperiencia(tempoExperiencia);

                            Future.delayed(const Duration(seconds: 2), (() {
                              setState(() => salvando = !salvando);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Dados salvos com sucesso")));
                            }));
                            setState(() {
                              salvando = true;
                            });
                          },
                          child: const Text("Salvar")),
                    ],
                  ),
          )),
    );
  }
}
