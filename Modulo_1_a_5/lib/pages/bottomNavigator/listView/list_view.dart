import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
       SizedBox(
        height: 100,
         child: ListView(
                 scrollDirection: Axis.horizontal,
                 children: const [
                   FaIcon(FontAwesomeIcons.gamepad),
                   SizedBox(width: 10,),
                   FaIcon(FontAwesomeIcons.android),
                   SizedBox(width: 10,),
                   FaIcon(FontAwesomeIcons.apple),
                   SizedBox(width: 10,),
                   FaIcon(FontAwesomeIcons.fish, color: Colors.cyan, size: 20),
                   SizedBox(width: 10,),
                   FaIcon(FontAwesomeIcons.fish),
                   SizedBox(width: 10,),
                   FaIcon(FontAwesomeIcons.fish),
                   SizedBox(width: 10,),
                   FaIcon(FontAwesomeIcons.fish),
                   SizedBox(width: 10,),
                 ],
               ),
       ),
       SizedBox(
        height: 400,
         child: ListView(
                 children: [
                   Padding(
              padding: const EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: 170.0,
                animation: true,
                animationDuration: 10000,
                lineHeight: 20.0,
                leading: const Text("left content"),
                trailing: const Text("right content"),
                percent: 0.8,
                center: const Text("80.0%"),
                barRadius: Radius.circular(10),
                progressColor: Colors.red,
              ),
            ),
            CircularPercentIndicator(
              animation: true,
              animationDuration: 5000,
              backgroundColor: Colors.amber,
              progressColor: Colors.green,
              center: const Text("40%"),
              percent: 0.4,
              radius: 50)
            
                 ],
               ),
       ),

      ],
    );
  }
}
