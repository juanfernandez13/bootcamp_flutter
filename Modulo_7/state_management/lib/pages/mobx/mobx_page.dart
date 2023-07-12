import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../services/mobx_contador_random.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({super.key});

  @override
  State<MobxPage> createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  ContadorMobx contadorMobx = ContadorMobx();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Card(
        child: SizedBox(
          height: 250,
          width: width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Observer(
                builder: (context) {
                  return Text(
                    contadorMobx.random.toString(),
                    style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  );
                }
              ),
              TextButton(
                  onPressed: () => contadorMobx.gerarRandom(),
                  child: const Text(
                    "Gerar número",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      )
    ]);
  }
}
