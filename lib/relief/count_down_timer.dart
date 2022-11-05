import 'dart:async';

import 'package:flutter/material.dart';

typedef OnCountDown = Widget Function(BuildContext build, int seconds);

class CountDownTimer extends StatefulWidget {
  final int seconds;
  final OnCountDown onCountDown;

  const CountDownTimer(this.seconds, this.onCountDown, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  int maxSeconds = 0;
  int currSeconds = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    maxSeconds = widget.seconds;
    currSeconds = widget.seconds * 2;
    const oneSec = Duration(milliseconds: 500);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (currSeconds == 0) {
        setState(() => timer.cancel());
      } else {
        setState(() => currSeconds--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.onCountDown(context,  currSeconds ~/ 2);

  }
}
