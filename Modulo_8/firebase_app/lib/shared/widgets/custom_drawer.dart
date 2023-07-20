import 'package:firebase_app/pages/tarefas/tarefa_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text("Tarefas Firebase"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const TarefasPage()));
            },
          )
        ],
      ),
    );
  }
}
