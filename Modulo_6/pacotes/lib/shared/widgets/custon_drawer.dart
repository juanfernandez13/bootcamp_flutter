import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pacotes/pages/auto_size.dart';
import 'package:pacotes/pages/percent_indicator.dart';

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
                children: const [
                  FaIcon(FontAwesomeIcons.icons),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Font Awesome Icons")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => const PercentIndicatorPage())
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.percent),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Percent Indicator")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => AutoSizePage())
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.paperclip),
                  SizedBox(
                    width: 10,
                  ),
                  Text("AutoSize")
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
