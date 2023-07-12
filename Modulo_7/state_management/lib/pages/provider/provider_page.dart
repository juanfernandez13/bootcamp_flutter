import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/pages/provider/provider_tarefas_page.dart';
import 'package:state_management/services/contador_random.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.cyan,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Provider",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
              ExpansionTile(
                title: const Text("Gerador de números"),
                textColor: Colors.black,
                iconColor: Colors.black,
                collapsedTextColor: Colors.red,
                backgroundColor: Colors.green,
                children: [
                  SizedBox(
                    height: 200,
                    child: Consumer<ContadorRandom>(
                        builder: (_, contadorRandom, widget) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            contadorRandom.contador.toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                          TextButton(
                              onPressed: () => contadorRandom.gerarRandom(),
                              child: const Text(
                                "Gerar",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ))
                        ],
                      );
                    }),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return TarefaProviderPage();
                    }));
                  },
                  child: const Text("tarefas"))
            ],
          ),
        ));
  }
}
