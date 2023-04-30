import 'package:flutter/material.dart';
import 'package:pacotes/pages/splash_screen.dart';
import 'package:pacotes/repository/tarefa_repository.dart';
import 'package:pacotes/service/contador_service.dart';
import 'package:pacotes/service/dark_mode_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(create: (_) => DarkModeService()),
        ChangeNotifierProvider<ContadorService>(create: (_) => ContadorService()),
        ChangeNotifierProvider<TarefaRepository>(create: (_) => TarefaRepository()),
      ],
      child: Consumer<DarkModeService>(
              builder: (_,darkModeService,widget) {
          return MaterialApp(
            theme: darkModeService.darkMode ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}