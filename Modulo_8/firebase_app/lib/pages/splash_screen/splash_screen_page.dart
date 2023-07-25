import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarHome();
  }

  carregarHome() async {
    analytics.logEvent(name: "SplashScreen");
    final prefs = await SharedPreferences.getInstance();
    var uuid = const Uuid();
    var userID = prefs.getString('user_id') ?? uuid.v4();
    await prefs.setString('user_id', userID);
    Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Firebase App"), CircularProgressIndicator()],
          ),
        ),
      ),
    );
  }
}
