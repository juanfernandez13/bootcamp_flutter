import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  var battery = Battery();
  var levelBattery = 0.0;
  BatteryState statusBattery = BatteryState.discharging;
  @override
  void initState() {
    battery.onBatteryStateChanged.listen((event) {
      statusBattery = event;
      setState(() {});
    });
    initPage();
    super.initState();
  }

  initPage() async {
    levelBattery =
        double.tryParse((await battery.batteryLevel).toString()) ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Battery Page"),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 2000,
                  progressColor: Colors.green,
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const FaIcon(FontAwesomeIcons.batteryFull),
                    Text("Status: ${statusBattery.toString()}")
                  ],),
                  center: Text("$levelBattery%"),
                  percent: levelBattery / 100,
                  radius: 50
                  ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
