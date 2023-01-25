import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text("Usuário 2"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Olá! Tudo bem?"),
              Text("08:46"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: ((value) {}),
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(value: "valor 1", child: Text("Opção 1")),
                const PopupMenuItem<String>(value: "valor 2", child: Text("Opção 2")),
                const PopupMenuItem<String>(value: "valor 3", child: Text("Opção 3")),
              ];
            },
          ),
        ),
       SizedBox(
        height: 400,
         child: ListView(
                 scrollDirection: Axis.horizontal,
                 children: [
                   Image.asset(AppImages.user1),
                   Image.asset(AppImages.user2),
                   Image.asset(AppImages.user3),
                   Image.asset(AppImages.paisagem1),
                   Image.asset(AppImages.paisagem2),
                   Image.asset(AppImages.paisagem3),
                 ],
               ),
       ),
      ],
    );
  }
}
