import 'package:digital_clock/pages/value.dart';
import 'package:flutter/material.dart';

class time extends StatefulWidget {
  const time({Key? key}) : super(key: key);

  @override
  State<time> createState() => _timeState();
}

class _timeState extends State<time> {
  int second = 0;
  int minute = 0;
  int hour = 0;
  bool isTrue = false;

  startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (hour <= 00 && minute <= 00 && second <= 00) {
          hour = 0;
          minute = 0;
          second = 0;
        }
        else if (second == 00) {
          if (minute <= 0 && hour <= 0) {
            minute = 0;
            second = 0;
          } else {
            minute--;
            second = 60;
          }
          second--;
        }
        else {
          second--;
        }
      });
      (isTrue) ? startTimer() : second++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Value data = ModalRoute.of(context)!.settings.arguments as Value;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Timer",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, 'addtimer');
              });
            },
            child: const Icon(Icons.add, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 12.5),
        ],
        backgroundColor: Colors.black,
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
                  color: Colors.grey),
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
                        setState(() {
                          hour = data.myHour;
                          minute = data.myMinute;
                          second = data.mySecond;
                        });
                        startTimer();
                      },
                      child: Container(
                        height: 70,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border:
                              Border.all(color: Colors.grey.shade900, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.play_arrow_sharp,
                            color: Colors.grey, size: 40),
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
                          border:
                              Border.all(color: Colors.grey.shade900, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.pause,
                            color: Colors.grey, size: 40),
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
                      border: Border.all(color: Colors.grey.shade900, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.refresh_sharp,
                        color: Colors.grey, size: 35),
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
                    color: Colors.grey,
                  ),
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
                  Navigator.pushNamed(context, 'time');
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      "https://cdn-icons-png.flaticon.com/128/570/570322.png",
                      color: Colors.blue,
                      height: 28),
                  const Text(
                    "Timer",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
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
