import 'package:digital_clock/pages/Addtimer.dart';
import 'package:digital_clock/pages/Alarm.dart';
import 'package:digital_clock/pages/Stop.dart';
import 'package:digital_clock/pages/World_Clock.dart';
import 'package:digital_clock/pages/time.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const Clock(),
        'alarm' : (context) => const Alarm(),
        'clock' : (context) => const World_Clock(),
        'stop' : (context) => const Stop(),
        'time' : (context) => const time(),
        'addtimer': (context) => const Addtimer(),
      },
    ),
  );
}

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {


  @override
  Widget build(BuildContext context) {
    return Alarm();
  }
}
