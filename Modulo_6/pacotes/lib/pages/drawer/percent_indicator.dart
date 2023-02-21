import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentIndicatorPage extends StatefulWidget {
  const PercentIndicatorPage({super.key});

  @override
  State<PercentIndicatorPage> createState() => _PercentIndicatorPageState();
}

class _PercentIndicatorPageState extends State<PercentIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Percent Indicator"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              animation: true,
              animationDuration: 5000,
              backgroundColor: const Color(0xFF15018A),
              progressColor: Colors.amber,
              header: const Text("header"),
              footer: const Icon(Icons.person),
              center: const Text("50%"),
              percent: 0.5,
              radius: 50
              ),
              LinearPercentIndicator(
                backgroundColor: const Color(0xFF2D8F17),
                progressColor: Colors.deepOrange,
                animation: true,
              animationDuration: 5000,
                percent: 0.8,
                leading: const FaIcon(FontAwesomeIcons.infinity),
                trailing: const FaIcon(FontAwesomeIcons.infinity),
                lineHeight: 25,
                barRadius: const Radius.circular(15),
              )
          ],
        ),
      ),
    ));
  }
}
