import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pacotes/pages/drawer/auto_size.dart';
import 'package:pacotes/pages/drawer/battery_page.dart';
import 'package:pacotes/pages/drawer/percent_indicator.dart';

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
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PercentIndicatorPage()));
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
                  context, MaterialPageRoute(builder: (_) => const AutoSizePage()));
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const BatteryPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.batteryHalf),
                  SizedBox(
                    width: 10,
                  ),
                  Text("AutoSize")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              var f = NumberFormat('#,###.0#', "en_US");
              var fBR = NumberFormat('#,###.0#', "pt_BR");
              debugPrint(f.toString());
              debugPrint(fBR.toString());

              var date = DateTime(2023, 02, 21);
              debugPrint(DateFormat("EEEEEE", "en_US").format(date));
              debugPrint(DateFormat("EEEEEE", "pt_BR").format(date));

              Intl.defaultLocale = "pt_BR";
              debugPrint(date.toString());
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.house),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Intl")
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
