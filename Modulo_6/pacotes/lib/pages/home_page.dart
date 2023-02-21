import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pacotes/shared/widgets/custon_drawer.dart';

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
          const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
          onTap: (page) => tabController.index = page,
          controller: tabController,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ]),
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: const Text("Pacotes"),
      ),
      body: Column(
        children: [
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: [
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.deepPurple,
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
