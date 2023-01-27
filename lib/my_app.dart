import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/pages/login_page.dart';
// import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        // textTheme: GoogleFonts.acmeTextTheme(),
      ),
      // home: HomePage(),
      home:const LoginPage(),
    );
  }
}
