import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/pages/splash_screen.dart';
import 'package:state_management/services/provider/contador_random.dart';
import 'package:state_management/services/provider/dark_mode_service.dart';
import 'package:get/get.dart';
import 'repository/tarefa_repository.dart';


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
        ChangeNotifierProvider<ContadorRandom>(create: (_) => ContadorRandom()),
        ChangeNotifierProvider<TarefaRepository>(create: (_) => TarefaRepository()),

      ],
      child: Consumer<DarkModeService>(
        builder: (_, darkModeService, widget) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: darkModeService.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}
