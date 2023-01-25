import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label_cadastro.dart';

class HiveDadosCadastraisPage extends StatefulWidget {
  const HiveDadosCadastraisPage({super.key});

  @override
  State<HiveDadosCadastraisPage> createState() =>
      _HiveDadosCadastraisPageState();
}

class _HiveDadosCadastraisPageState extends State<HiveDadosCadastraisPage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  DadosCadastraisModel dadosCadastraisModel = DadosCadastraisModel.vazio();
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

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagemRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();
    nivelSelecionado = dadosCadastraisModel.nivelExperiencia ?? "";
    linguagensSelecionadas = dadosCadastraisModel.linguagens;
    tempoExperiencia = dadosCadastraisModel.tempoExperiencia ?? "";
    salarioEscolhido = dadosCadastraisModel.salario ?? 0;
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
                              initialDate: DateTime(2022, 1, 1),
                              firstDate: DateTime(1900, 1, 1),
                              lastDate: DateTime(2023, 1, 15));
                          if (data != null) {
                            dataNascimentoController.text = data.toString();
                            dadosCadastraisModel.dataNascimento = data;
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
                                  selected:
                                      dadosCadastraisModel.nivelExperiencia ==
                                          nivel,
                                  value: nivel.toString(),
                                  groupValue:
                                      dadosCadastraisModel.nivelExperiencia,
                                  onChanged: ((value) {
                                    setState(() => dadosCadastraisModel
                                        .nivelExperiencia = value.toString());
                                  })))
                              .toList()),
                      const TextLabelCadastro(texto: 'Linguagens preferidas'),
                      Column(
                          children: linguagens
                              .map(
                                (linguagem) => CheckboxListTile(
                                    title: Text(linguagem),
                                    dense: true,
                                    value: dadosCadastraisModel.linguagens
                                        .contains(linguagem),
                                    onChanged: ((value) {
                                      if (value == true) {
                                        setState(() => dadosCadastraisModel
                                            .linguagens
                                            .add(linguagem));
                                      } else {
                                        setState(() => dadosCadastraisModel
                                            .linguagens
                                            .remove(linguagem));
                                      }
                                    })),
                              )
                              .toList()),
                      const TextLabelCadastro(texto: "Tempo de experiância"),
                      const SizedBox(height: 10),
                      DropdownButton(
                          isExpanded: true,
                          value: dadosCadastraisModel.tempoExperiencia,
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
                              dadosCadastraisModel.tempoExperiencia = value!;
                            });
                          })),
                      const SizedBox(height: 15),
                      TextLabelCadastro(
                          texto:
                              "Pretenção Salarial R\$ ${dadosCadastraisModel.salario!.round().toString()}"),
                      const SizedBox(height: 5),
                      Slider(
                          min: 0,
                          max: 10000,
                          value: dadosCadastraisModel.salario!,
                          label:
                              dadosCadastraisModel.salario!.round().toString(),
                          onChanged: ((value) {
                            setState(
                                () => dadosCadastraisModel.salario = value);
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
                            if (dadosCadastraisModel.nivelExperiencia == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Selecione um nivel de experiência")));
                              return;
                            }
                            if (dadosCadastraisModel.linguagens.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Selecione uma linguagem")));
                              return;
                            }
                            if (dadosCadastraisModel.tempoExperiencia == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Selecione um tempo de experiência")));
                              return;
                            }
                            if (dadosCadastraisModel.salario! < 1200) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "O salario deve ser maior que 1200")));
                              return;
                            }
                            dadosCadastraisModel.nome = nomeController.text;
                            dadosCadastraisRepository
                                .salvar(dadosCadastraisModel);
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
