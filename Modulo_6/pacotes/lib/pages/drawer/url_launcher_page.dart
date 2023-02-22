import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPage extends StatefulWidget {
  const UrlLauncherPage({super.key});

  @override
  State<UrlLauncherPage> createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Url Launcher")),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse("https://google.com"));
                  },
                  child: Row(
                    children: const [
                      FaIcon(FontAwesomeIcons.link),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Abrir google")
                    ],
                  )),
              TextButton(
                  onPressed: () async {
                    await launchUrl(
                        Uri.parse("google.navigation:q=Orlando FL&mode=d"));
                  },
                  child: Row(
                    children: const [
                      FaIcon(FontAwesomeIcons.map),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Abrir Maps")
                    ],
                  )),
              ],
          ),
        ),
      ),
    ));
  }
}
