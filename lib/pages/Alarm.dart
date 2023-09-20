import 'package:digital_clock/pages/value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  bool mySwitch = false;
  bool mySwitch1 = false;
  bool mySwitch2 = false;
  bool mySwitch3 = false;
  bool mySwitch4 = false;
  bool mySwitch5 = false;


  List<Map<String, dynamic>> myList = [
    {
      'title': "8:00",
      'am/pm': "AM",
      'detail': "Once",
      'var': false,
    },
    {
      'title': "10:00",
      'am/pm': "AM",
      'detail': "Once",
      'var': false,
    },
    {
      'title': "12:00",
      'am/pm': "PM",
      'detail': "Thursday",
      'var': false,
    },
    {
      'title': "3:00",
      'am/pm': "PM",
      'detail': "Everyday",
      'var': false,
    },
    {
      'title': "6:00",
      'am/pm': "PM",
      'detail': "Once",
      'var': false,
    },
    {
      'title': "9:00",
      'am/pm': "PM",
      'detail': "Once",
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          "Alarm",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        actions: const [
          Icon(Icons.add, color: Colors.white, size: 26),
          SizedBox(width: 12.5),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: myList.map((e) => Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: e['title'],
                          style: const TextStyle(
                            fontSize: 28,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: " ${e['am/pm']}\n",
                              style: const TextStyle(
                                fontSize: 17,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: e['detail'],
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      NeumorphicSwitch(
                        height: 30,
                        value: e['var'],
                        duration: const Duration(seconds: 1),
                        style: NeumorphicSwitchStyle(
                          activeTrackColor: Colors.green.shade600,
                          inactiveTrackColor: Colors.grey.shade300,
                          inactiveThumbColor: const Color(0xff4e4e4e),
                          activeThumbColor: Colors.white,
                        ),
                        onChanged: (val) {
                          setState(() {
                            e['var'] = val;
                          });
                        },
                      ),
                    ],
                  ),

                ),).toList(),
        ),
      ),
      bottomNavigationBar: Container(
        height: 55,
        color: Colors.black,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'alarm');
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.alarm, color: Colors.blue, size: 30),
                  Text("Alarm",
                      style: TextStyle(fontSize: 14, color: Colors.blue)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'clock');
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.language_outlined, color: Colors.grey, size: 30),
                  Text(
                    "World Clock",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'stop');
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      "https://cdn-icons-png.flaticon.com/512/3867/3867499.png",
                      height: 30,
                      color: Colors.grey),
                  const Text(
                    "StopWatch",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  Value v = Value(myMinute: 0,mySecond: 0,myHour: 0);
                  Navigator.pushNamed(context, 'time',arguments: v);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      "https://cdn-icons-png.flaticon.com/128/570/570322.png",
                      color: Colors.grey,
                      height: 28),
                  const Text(
                    "Timer",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
