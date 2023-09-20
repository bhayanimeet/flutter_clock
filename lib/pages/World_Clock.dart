import 'package:digital_clock/pages/value.dart';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class World_Clock extends StatefulWidget {
  const World_Clock({Key? key}) : super(key: key);

  @override
  State<World_Clock> createState() => _World_ClockState();
}

class _World_ClockState extends State<World_Clock> {
  DateTime myTime = DateTime.now();
  List<String> myMonth = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "June",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  List<String> myDay = [
    "Mon",
    "Tue",
    "wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  @override
  Widget build(BuildContext context) {
    var duration = myTime.timeZoneOffset;
    print(DateTime.parse('2018-09-07T17:29:12+02:00').isUtc);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          "World Clock",
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
      body: Column(
        children: [
          const SizedBox(height: 5),
          Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: AnalogClock(
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              isLive: true,
              datetime: DateTime.now(),
              digitalClockColor: Colors.white,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              secondHandColor: Colors.red.shade800,
              numberColor: Colors.white,
              textScaleFactor: 1.4,
              tickColor: Colors.white54,
              showAllNumbers: true,
            ),
          ),
          const SizedBox(height: 15),
          Text("India Standard Time",style: TextStyle(color: Colors.grey.shade400,),),
          Text("${myDay[myTime.weekday - 1]}, ${myMonth[myTime.month - 1]} ${myTime.day}",style: TextStyle(color: Colors.white,fontSize: 17,height: 1.5),),
        ],
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
                  Icon(Icons.alarm, color: Colors.grey, size: 30),
                  Text(
                    "Alarm",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
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
                  Icon(Icons.language_outlined, color: Colors.blue, size: 30),
                  Text(
                    "World Clock",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
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
