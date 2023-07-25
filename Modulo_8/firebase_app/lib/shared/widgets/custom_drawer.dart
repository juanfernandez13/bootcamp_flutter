import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app/pages/tarefas/tarefa_page.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../../pages/chat/chat_page.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final remoteConfig = FirebaseRemoteConfig.instance;
  TextEditingController nickNameController = TextEditingController();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Tarefas Firebase"),
            onTap: () {
              analytics.logEvent(name: "Tarefas Firebase");
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TarefasPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("Firebase Chat"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(remoteConfig.getString("TEXTO_CHAT")),
                            TextField(
                              controller: nickNameController,
                            ),
                            TextButton(
                              child: const Text("Entrar no chat"),
                              onPressed: () {
                                analytics.logEvent(name: "Chat_Firebase");
                                nickNameController.clear();
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ChatPage(
                                            nickName: nickNameController.text
                                                .trim())));
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
          ListTile(
            onTap: () => throw Exception(),
            leading: const Icon(Icons.bug_report),
            title: const Text("Crashlytics - Forçar"),
          )
        ],
      ),
    );
  }
}
