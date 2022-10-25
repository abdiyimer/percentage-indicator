// ignore_for_file: camel_case_types, depend_on_referenced_packages
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class homepage extends StatefulWidget {
  homepage({
    super.key,
  });

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  double percent = 0.0;
  int percentInt = 0;
  //double x = 0;

  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 2), (_) {
      setState(() {
        if (percent >= 100.0000000000) {
          timer!.cancel();

          // percent=0;
        } else {
          percent += 0.02;
        }

        percentInt = percent.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              radius: 125.0,
              lineWidth: 25.0,
              percent: percent / 100,
              animation: true,
              animateFromLastPercent: true,
              // animationDuration: 10,
              header: Text(
                "percentage:" + percentInt.toString() + " %",
              ),
              center: Text(
                percentInt.toString() + " %",
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
              circularStrokeCap: CircularStrokeCap.round,
            ),

            // Linear

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: LinearPercentIndicator(
                //width: 150.0,
                lineHeight: 30.0,
                percent: percent / 100,
                animation: true,
                //animationDuration: 1000,
                center: Text(
                  "$percent %",
                  style: const TextStyle(fontSize: 14.0),
                ),
                //leading: const Text('Empty '),
                //trailing: const Icon(Icons.mood),
                // ignore: deprecated_member_use
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                //border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(5, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Center(child: Text('progress of the project')),
            ),
          ],
        ),
      ),
    );
  }
}
