import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/bottomNavigator/cardPage/card_page.dart';
import 'package:trilhaapp/pages/bottomNavigator/httpPage/http_page.dart';
import 'package:trilhaapp/pages/bottomNavigator/listView/list_view.dart';
import 'package:trilhaapp/pages/bottomNavigator/tarefaPage/hive_tarefa_page.dart';
import 'package:trilhaapp/pages/bottomNavigator/tarefaPage/sqlite_tarefa_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  int posicaoPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MainPage"),
        ),
        drawer:const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPage = value;
                  });
                },
                // scrollDirection: Axis.vertical,
                children: const [
                  CardPage(),
                  ListViewPage(),
                  HttpPage(),
                  SQLTarefasPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: ((value) {
                  pageController.animateToPage(value, duration: const Duration(milliseconds:500 ), curve: Curves.easeInCubic);
                }),
                currentIndex: posicaoPage,
                items: const [
                  BottomNavigationBarItem(
                      label: "CardPage", icon: Icon(Icons.home, )),
                  BottomNavigationBarItem(
                      label: "pag1", icon: Icon(Icons.person, )),
                  BottomNavigationBarItem(
                      label: "pag2", icon: Icon(Icons.download, )),
                  BottomNavigationBarItem(
                      label: "pag3", icon: Icon(Icons.add_a_photo_sharp, )),
                ])
          ],
        ),
      ),
    );
  }
}
