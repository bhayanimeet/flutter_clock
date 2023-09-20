import 'package:digital_clock/pages/value.dart';
import 'package:flutter/material.dart';

class Stop extends StatefulWidget {
  const Stop({Key? key}) : super(key: key);

  @override
  State<Stop> createState() => _StopState();
}

class _StopState extends State<Stop> {
  int second = 0;
  int minute = 0;
  int hour = 0;
  bool isTrue = false;

  startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (hour == 24) {
          hour = 24;
          minute = 0;
          second = 0;
        } else if (second < 59) {
          second++;
        } else if (minute == 59) {
          hour++;
          minute = 0;
        } else if (second == 59) {
          minute++;
          second = 0;
        }
      });
      (isTrue) ? startTimer() : second;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          "Stopwatch",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$hour : $minute : $second",
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTrue = true;
                        });
                        startTimer();
                      },
                      child: Container(
                        height: 70,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.grey.shade900,width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.play_arrow_sharp,color: Colors.grey,size: 40),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTrue = false;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.grey.shade900,width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.pause,color: Colors.grey,size: 40),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTrue = false;
                      second = 0;
                      minute = 0;
                      hour = 0;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.grey.shade900,width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.refresh_sharp,color: Colors.grey,size: 35),
                  ),
                ),
              ],
            ),
          ],
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
                  Icon(Icons.alarm, color: Colors.grey, size: 30),
                  Text("Alarm",
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
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
                      color: Colors.blue),
                  const Text(
                    "StopWatch",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
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
