// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  bool _visibleStart = true;
  bool _visibleCancel = false;

  bool _isButtonStartDisabled = false;

  String motivateText = '';
  double opacityText = 1.0;

  void counter() {
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (globals.isClicked == true) {
        setState(() {
          globals.counterLabelMilliseconds++;
          if (globals.counterLabelMilliseconds == 100) {
            globals.counterLabelMilliseconds = 0;
            globals.counterLabelSeconds++;
            if (globals.counterLabelSeconds == 60) {
              globals.counterLabelSeconds = 0;
              globals.counterLabelMinutes++;
              if (globals.counterLabelMinutes == 60) {
                globals.counterLabelMinutes = 0;
                globals.counterLabelHours++;
                if (globals.counterLabelHours == 24) {
                  globals.counterLabelHours = 0;
                  globals.counterLabelDays++;
                  if (globals.counterLabelDays == 30) {
                    globals.counterLabelDays = 0;
                    globals.counterLabelMonths++;
                    if (globals.counterLabelMonths == 12) {
                      globals.counterLabelMonths = 0;
                      globals.counterLabelYears++;
                    }
                  }
                }
              }
            }
          }
        });
        if (globals.counterLabelMonths >= 2) {
          motivateText = '✅ Author: @alexndrev';
        }
      } else {
        timer.cancel();
        globals.counterLabelMilliseconds = 0;
        globals.counterLabelSeconds = 0;
        globals.counterLabelMinutes = 0;
        globals.counterLabelHours = 0;
        globals.counterLabelDays = 0;
        globals.counterLabelMonths = 0;
        globals.counterLabelYears = 0;
        motivateText = '';
      }
    });
  }

  // timer method
  void _startCount() {
    _visibleStart = !_visibleStart;
    _visibleCancel = !_visibleCancel;

    _isButtonStartDisabled = true;

    if (globals.isClicked == true) {
    } else {
      globals.isClicked = true;
      counter();
    }
  }

  void _endCount() {
    globals.isClicked = false;
    _visibleCancel = !_visibleCancel;
    _visibleStart = !_visibleStart;

    _isButtonStartDisabled = false;

    globals.counterLabelMilliseconds = 0;
    globals.counterLabelSeconds = 0;
    globals.counterLabelMinutes = 0;
    globals.counterLabelHours = 0;
    globals.counterLabelDays = 0;
    globals.counterLabelMonths = 0;
    globals.counterLabelYears = 0;
    counter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 12, 12, 12),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   // Days
            //   Text(
            //       globals.isClicked == false
            //           ? '00'
            //           : '${globals.counterLabelYears < 10 ? '0${globals.counterLabelYears}' : globals.counterLabelYears}',
            //       style: const TextStyle(
            //           fontSize: 14,
            //           fontFamily: 'Lato Light',
            //           color: Colors.white)),

            //   // Separator
            //   Text(' / ',
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontFamily: 'Lato Light',
            //           color: Colors.white.withOpacity(0.5))),
            //   // Days
            //   Text(
            //       globals.isClicked == false
            //           ? '00'
            //           : '${globals.counterLabelMonths < 10 ? '0${globals.counterLabelMonths}' : globals.counterLabelMonths}',
            //       style: const TextStyle(
            //           fontSize: 14,
            //           fontFamily: 'Lato Light',
            //           color: Colors.white)),

            //   // Separator
            //   Text(' / ',
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontFamily: 'Lato Light',
            //           color: Colors.white.withOpacity(0.5))),
            //   // Days
            //   Text(
            //       globals.isClicked == false
            //           ? '00'
            //           : '${globals.counterLabelDays < 10 ? '0${globals.counterLabelDays}' : globals.counterLabelDays}',
            //       style: const TextStyle(
            //           fontSize: 14,
            //           fontFamily: 'Lato Light',
            //           color: Colors.white)),

            // ]),
            // Container(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [

              // Days
              Text(
                   globals.isClicked == false
                       ? '00'
                       : '${globals.counterLabelDays < 10 ? '0${globals.counterLabelDays}' : globals.counterLabelDays}',
                   style: const TextStyle(
                       fontSize: 25,
                       fontFamily: 'Lato Light',
                       color: Color.fromARGB(255, 255, 255, 255))),

              // Separator
              Text(':',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5))),

              // Hours
              Text(
                  globals.isClicked == false
                      ? '00'
                      : '${globals.counterLabelMinutes < 10 ? '0${globals.counterLabelMinutes}' : globals.counterLabelMinutes}',
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: Color.fromARGB(255, 255, 255, 255))),

              // Separator
              Text(':',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5))),

              // Minutes
              Text(
                  globals.isClicked == false
                      ? '00'
                      : '${globals.counterLabelMinutes < 10 ? '0${globals.counterLabelMinutes}' : globals.counterLabelMinutes}',
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: Color.fromARGB(255, 255, 255, 255))),

              // Separator
              Text(':',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5))),

              // Seconds
              Text(
                  globals.isClicked == false
                      ? '00'
                      : '${globals.counterLabelSeconds < 10 ? '0${globals.counterLabelSeconds}' : globals.counterLabelSeconds}',
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: Color.fromARGB(255, 255, 255, 255))),

              // Separator
              Text('.',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5))),

              // Milliseconds
              Text(
                  globals.isClicked == false
                      ? '00'
                      : '${globals.counterLabelMilliseconds < 10 ? '0${globals.counterLabelMilliseconds}' : globals.counterLabelMilliseconds}',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato Light',
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5))),

            ]),

            Text(motivateText.toString(),
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Lato Light',
                    color: Color.fromARGB(255, 255, 255, 255))),
            Container(height: 250),
            AnimatedOpacity(
                opacity: _visibleStart ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 333),
                child: MaterialButton(
                  enableFeedback: false,
                  onPressed: _isButtonStartDisabled ? null : _startCount,
                  color: const Color.fromARGB(255, 12, 12, 12),
                  child: const Text('S T A R T',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontFamily: 'Lato Light')),
                )),
            AnimatedOpacity(
                opacity: _visibleCancel ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 333),
                child: MaterialButton(
                  enableFeedback: false,
                  onPressed: _isButtonStartDisabled ? _endCount : null,
                  color: const Color.fromARGB(255, 12, 12, 12),
                  child: const Text('C A N C E L',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontFamily: 'Lato Light')),
                )),
            Container(height: 100),
          ],
        )));
  }
}
