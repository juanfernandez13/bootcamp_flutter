import 'package:firebase_app/pages/chat/chat_page.dart';
import 'package:firebase_app/shared/widgets/custom_drawer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final remoteConfig = FirebaseRemoteConfig.instance;
  TextEditingController nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Color(int.parse("0xff${remoteConfig.getString("COR_FUNDO_TELA")}")),
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: const Text("FirebaseApp"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
          ],
        ),
      ),
    );
  }
}
