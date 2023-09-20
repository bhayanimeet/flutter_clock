import 'package:digital_clock/pages/time.dart';
import 'package:digital_clock/pages/value.dart';
import 'package:flutter/material.dart';

class Addtimer extends StatefulWidget {
  const Addtimer({Key? key}) : super(key: key);

  @override
  State<Addtimer> createState() => _AddtimerState();
}

class _AddtimerState extends State<Addtimer> {
   int myHour = 0;
   int myMinute = 0;
   int mySecond = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Add timer",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 55,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 18),
                          child: const Text(
                            "H",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 37),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 7),
                          child: const Text(
                            "M",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 37),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 9),
                          child: const Text(
                            "S",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 39),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 45,
                        perspective: 0.01,
                        diameterRatio: 1.2,
                        onSelectedItemChanged: (i) {
                          setState(() {
                            myHour = i;
                          });
                        },
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 24,
                            builder: (context, index) {
                              return Text(
                                (index < 10) ? "0$index" : "$index",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1.5,
                                ),
                              );
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 45,
                        perspective: 0.01,
                        diameterRatio: 1.2,
                        onSelectedItemChanged: (i) {
                          setState(() {
                            myMinute = i;
                          });
                        },
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: (context, index) {
                              return Text(
                                (index < 10) ? "0$index" : "$index",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1.5,
                                ),
                              );
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 45,
                        perspective: 0.01,
                        diameterRatio: 1.2,
                        onSelectedItemChanged: (i) {
                          setState(() {
                            mySecond = i;
                          });
                        },
                        physics: const FixedExtentScrollPhysics(),
                        childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 60,
                            builder: (context, index) {
                              return Text(
                                (index < 10) ? "0$index" : "$index",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1.5,
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 80),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Value v = Value(myHour: myHour,mySecond: mySecond,myMinute: myMinute);
                  setState(() {
                    Navigator.pushNamed(context, 'time', arguments: v);
                  });
                },
                child: Container(
                  width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade900, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Start timer",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
