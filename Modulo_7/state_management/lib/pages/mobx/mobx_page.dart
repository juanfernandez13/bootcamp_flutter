import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/pages/mobx/tarefa_mobx_page.dart';
import 'package:state_management/services/store_mobx_contador.dart';
import '../../services/mobx_contador_random.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({super.key});

  @override
  State<MobxPage> createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  ContadorMobx contadorMobx = ContadorMobx();
  StoreMobxService storeMobxService = StoreMobxService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TarefaMobxPage()));
          },
          child: Text("Lista de Tarefas")),
      Card(
        child: SizedBox(
          height: 250,
          width: width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Mobx",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Observer(builder: (context) {
                return Text(
                  contadorMobx.random.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.w700),
                );
              }),
              TextButton(
                  onPressed: () => contadorMobx.gerarRandom(),
                  child: const Text(
                    "Gerar número",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
      Card(
        child: SizedBox(
          height: 250,
          width: width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Mobx - Codegen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Observer(builder: (context) {
                return Text(
                  storeMobxService.random.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.w700),
                );
              }),
              TextButton(
                  onPressed: () => storeMobxService.gerarRandom(),
                  child: const Text(
                    "Gerar número",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    ]);
  }
}
