import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pacotes/pages/bottomBar/br_fields_page.dart';
import 'package:pacotes/service/dark_mode_service.dart';
import 'package:pacotes/shared/widgets/custon_drawer.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'bottomBar/contador_page.dart';
import 'bottomBar/lista_tarefas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 2, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: ConvexAppBar.badge(
          const {0: '99+', 1: Icons.assistant_photo, 4: Colors.greenAccent},
          onTap: (page) => tabController.index = page,
          controller: tabController,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'BR fields'),
          ]),
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: const Text("Pacotes"),
        actions: [
          IconButton(
              onPressed: () {
                Share.share("olhem o link https://google.com");
              },
              icon: const FaIcon(FontAwesomeIcons.shareNodes)),
          IconButton(
              onPressed: () async {
                var directory = await path_provider.getTemporaryDirectory();
                debugPrint(directory.toString());
                directory =
                    await path_provider.getApplicationSupportDirectory();
                debugPrint(directory.toString());
                directory =
                    await path_provider.getApplicationDocumentsDirectory();
                debugPrint(directory.toString());
              },
              icon: const FaIcon(FontAwesomeIcons.folder)),
          const Center(
            child: Text("Tema"),
          ),
          Consumer<DarkModeService>(
              builder: (_,darkModeService,widget) {
                return Switch(
                    value: darkModeService.darkMode,
                    onChanged: (bool value) {
                      darkModeService.darkMode = !darkModeService.darkMode;
                    });
              }
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              Container(
                color: Colors.blue,
                child: const ContadorPage(),
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.amber,
              ),
              TarefaProviderPage(),
              const BrFieldsPage()
            ],
          )),
        ],
      ),
    ));
  }
}
