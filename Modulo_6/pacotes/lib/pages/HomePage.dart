import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pacotes/shared/widgets/custon_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: CustonDrawer(),
      appBar: AppBar(
        title: const Text("Pacotes"),
      ),
      body: Column(
        children: [
          
        ],
      ),
    ));
  }
}
