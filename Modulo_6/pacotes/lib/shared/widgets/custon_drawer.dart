import 'package:flutter/material.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white60,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
              accountName: const Text("Juan Pablo"),
              accountEmail: const Text("email@email.com")),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [Text("Olá")],
              )),
            ),
          )
        ],
      ),
    );
  }
}
