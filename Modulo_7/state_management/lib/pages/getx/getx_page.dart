import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/getx/getx_random_controller.dart';
import 'tarefas_getx_page.dart';

class GetxPage extends StatefulWidget {
  const GetxPage({super.key});

  @override
  State<GetxPage> createState() => _GetxPageState();
}

class _GetxPageState extends State<GetxPage> {
  var getxRandom = GetxRandom();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(builder: (_) => TarefaGetxPage()));
          } ,
          child: const Text(
            "Gerar número",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),
      Card(
        child: SizedBox(
          height: 250,
          width: width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Getx",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Obx(() {
                return Text(
                  getxRandom.random.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.w700),
                );
              }),
              TextButton(
                  onPressed: () => getxRandom.gerarRandom(),
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
