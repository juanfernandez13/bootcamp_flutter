import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pacotes/pages/drawer/auto_size.dart';
import 'package:pacotes/pages/drawer/battery_page.dart';
import 'package:pacotes/pages/drawer/camera_page.dart';
import 'package:pacotes/pages/drawer/connectivity_plus_page.dart';
import 'package:pacotes/pages/drawer/device_info_page.dart';
import 'package:pacotes/pages/drawer/geolocator_page.dart';
import 'package:pacotes/pages/drawer/percent_indicator.dart';
import 'package:pacotes/pages/drawer/qr_code_page.dart';
import 'package:pacotes/pages/drawer/url_launcher_page.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const UrlLauncherPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.internetExplorer),
                  SizedBox(
                    width: 10,
                  ),
                  Text("URl Launcher")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const DeviceInfoPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.circleInfo),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Device Info")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ConnectivityPlusPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.wifi),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Device Info")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const GeolocatorPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.locationPinLock),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Geolocator")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const QrCodePage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.qrcode),
                  SizedBox(
                    width: 10,
                  ),
                  Text("QR code")
                ],
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const CameraPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.camera),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Camera")
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
