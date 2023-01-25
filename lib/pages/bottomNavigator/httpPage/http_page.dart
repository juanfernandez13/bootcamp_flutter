import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/repositories/viacep_repository.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  TextEditingController cepController = TextEditingController();
  ViaCep viaCep = ViaCep();
  ViaCepRepository viaCepRepository = ViaCepRepository();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Consultar seu cep'),
          TextField(
            maxLength: 8,
            keyboardType: TextInputType.number,
            controller: cepController,
            onChanged: (String value) async {
              String cep = value.replaceAll(RegExp(r'[^0-9]'), '');
              if (cep.length == 8) {
                setState(() => loading = true);
                viaCep = await viaCepRepository.consultarCep(cep);
                setState(() => loading = false);
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Text(viaCep.logradouro ?? ""),
          Text("${viaCep.localidade ?? ""} - ${viaCep.uf ?? ""}"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //comando then só é executado quando a requisição terminar, enquanto isso outras coisas são executadas
          var response = http
              .get(Uri.parse('https://www.google.com'))
              .then((value) => print(value.body));
          print("juan");
          //enquanto o await só vai permitir que outras coisas sejam executadas quando a requisição terminar
          var response2 = await http.get(Uri.parse('https://www.google.com'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
