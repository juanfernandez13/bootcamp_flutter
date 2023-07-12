import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.lightBlue, Colors.greenAccent])),
          child: Center(
              child: DefaultTextStyle(
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              stopPauseOnTap: true,
              totalRepeatCount: 1,
              displayFullTextOnTap: true,
              onFinished: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage())),
              animatedTexts: [
                RotateAnimatedText("State",
                    duration: const Duration(milliseconds: 1500)),
                RotateAnimatedText("Management",
                    duration: const Duration(milliseconds: 1500)),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
