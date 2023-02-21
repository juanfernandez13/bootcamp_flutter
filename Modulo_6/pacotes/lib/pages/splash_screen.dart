import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pacotes/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  openHome() {
    //forma de gerar o delay da splash screen
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    openHome();
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.amber,
              Colors.purple,
            ],
                stops: [
              0.1,
              0.6
            ])),
        child: Center(
            child: AnimatedTextKit(
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
          pause: const Duration(milliseconds: 100),
          onFinished: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          },
          animatedTexts: [
            TypewriterAnimatedText("Pacotes App",
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                speed: const Duration(milliseconds: 50),
                curve: Curves.easeInCubic),
            RotateAnimatedText("Em Flutter",
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ],
        )),
      ),
    ));
  }
}
