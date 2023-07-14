import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:state_management/pages/getx/getx_page.dart';
import 'package:state_management/pages/mobx/mobx_page.dart';
import 'package:state_management/pages/provider/provider_page.dart';
import 'package:state_management/services/provider/dark_mode_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("State Management"),
            actions: [
              const Center(child: Text("Dark Mode")),            
              Consumer<DarkModeService>(
                builder: (_, darkModeService, widget) {
                  return Switch(value: darkModeService.isDarkMode, onChanged: ((value) => darkModeService.isDarkMode = value),);
                }
              )
              ],
          ),
      bottomNavigationBar: ConvexAppBar.badge(
          const {},
          onTap: (page) => tabController.index = page,
          controller: tabController,
          activeColor: Colors.black45,
          items: const [
            TabItem(icon: Icon(Icons.first_page), title: "Provider"),
            TabItem(icon: Icon(FontAwesomeIcons.accessibleIcon), title: "MobX"),
            TabItem(icon: Icon(Icons.last_page), title: "GetX"),
          ]),
      body: Column(
        children: [
          Expanded(child: TabBarView(
            controller: tabController,
            children: [
                const ProviderPage(),
                const MobxPage(),
                GetxPage(),
            ],
          ))
        ],
      ),
    ));
  }
}
