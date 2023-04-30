import 'package:flutter/material.dart';
import 'package:pacotes/service/contador_service.dart';
import 'package:provider/provider.dart';

class ContadorPage extends StatelessWidget {
  const ContadorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<ContadorService>(builder: (_, contadorService, widget) {
          return Text(contadorService.contador.toString());
        }),
        TextButton(
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
            onPressed: () {
              Provider.of<ContadorService>(context, listen: false).incrementar();
            },
            child: const Text(
              "Incrementar",
            ))
      ],
    );
  }
}
