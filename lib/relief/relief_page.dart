import 'package:flutter/material.dart';

import 'count_down_timer.dart';

class ReliefPage extends StatefulWidget {
  const ReliefPage({Key? key}) : super(key: key);

  @override
  State<ReliefPage> createState() => _ReliefPageState();
}

class _ReliefPageState extends State<ReliefPage> {
  // 10min 20min 30min
  final List<bool> _selectedDurations = <bool>[true, false, false];
  int _selectedSeconds = 10 * 60;
  bool _started = false;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 10,
              ),
              child: Image(
                image: AssetImage('assets/IMG_2655.GIF'),
                height: 250,
              ),
            ),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedDurations.length; i++) {
                    _selectedDurations[i] = i == index;
                  }
                  _selectedSeconds = (index + 1) * 10 * 60;
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.red[700],
              selectedColor: Colors.white,
              fillColor: Colors.red[200],
              color: Colors.red[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedDurations,
              children: const [Text('10min'), Text('20min'), Text('30min')],
            ),
            _started
                ? CountDownTimer(_selectedSeconds, timerDisplay)
                : timerDisplay(context, _selectedSeconds),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() => _started = true);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Start",
                          style: TextStyle(
                              color: Colors.red[300],
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0),
                        ))),
                OutlinedButton(
                    onPressed: () {
                      setState(() => _started = false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Stop",
                        style: TextStyle(
                            color: Colors.red[300],
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    ]);
  }

  Widget timerDisplay(BuildContext build, int seconds) {
    int sRaw = seconds % 60;
    int mRaw = seconds ~/ 60;

    String s = sRaw.toString().padLeft(2, '0');
    String m = mRaw.toString().padLeft(2, '0');
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Text(
        "$m:$s",
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 72.0),
      ),
    );
  }
}
