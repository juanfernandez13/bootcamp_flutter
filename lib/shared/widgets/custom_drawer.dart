import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/drawer/post_page.dart';
import 'package:trilhaapp/pages/drawer/sharedPrefences/shared_config_page.dart';
import 'package:trilhaapp/pages/drawer/hive/hive_config_page.dart';
import 'package:trilhaapp/pages/login_page.dart';

import '../../pages/drawer/hive/hive_dados_cadastrais.dart';
import '../../pages/drawer/sharedPrefences/shared_dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (() {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        Column(
                          children: const [
                            ListTile(
                              title: Text("Câmera"),
                              leading: Icon(Icons.camera),
                            ),
                            ListTile(
                              title: Text("Câmera"),
                              leading: Icon(Icons.photo_album),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            }),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white60,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
              accountName: const Text('Juan Pablo'),
              accountEmail: const Text('juanp1310@outlook.com'),
            ),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.only(top: 5, left: 10),
                alignment: Alignment.centerLeft,
                height: 30,
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Dados cadastrais",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HiveDadosCadastraisPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.only(top: 5, left: 10),
                alignment: Alignment.centerLeft,
                height: 30,
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConfiguracoesHivePage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.only(top: 5, left: 10),
                alignment: Alignment.centerLeft,
                height: 30,
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  builder: ((BuildContext bc) {
                    return Wrap(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: InkWell(
                                      onTap: (() => Navigator.pop(context)),
                                      child: const Icon(Icons.close),
                                    )),
                                    const Expanded(
                                      flex: 7,
                                      child: Center(
                                        child: Text(
                                          "Termo de uso e privacidade",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                                const Text(
                                  "\nMussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.Suco de cevadiss deixa as pessoas mais interessantis.A ordem dos tratores não altera o pão duris.Cevadis im ampola pa arma uma pindureta.\n" +
                                      "Mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent.Suco de cevadiss deixa as pessoas mais interessantis.A ordem dos tratores não altera o pão duris.Cevadis im ampola pa arma uma pindureta.",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            )),
                      ],
                    );
                  }));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>const PostPage()));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 5, left: 10),
              alignment: Alignment.centerLeft,
              height: 30,
              width: double.infinity,
              child: Row(
                children: const [Icon(Icons.post_add), Text("Postagens")],
              ),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.only(top: 5, left: 10),
                alignment: Alignment.centerLeft,
                height: 30,
                width: double.infinity,
                child: Row(
                  children: const [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text("Meu App"),
                      content: Wrap(
                        children: const [
                          Text("Você sairá do aplicativo!"),
                          Text("Deseja realmente sair do aplicativo?"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: (() => Navigator.pop(context)),
                            child: const Text("Não")),
                        TextButton(
                            onPressed: (() => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()))),
                            child: const Text("Sim")),
                      ],
                    );
                  }));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
