import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/util/database.dart';
import 'dart:ui' as ui;

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GameState();
}

class GameState extends State<GameWidget> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  String displayMessage = "Correct!";
  int consecutiveRights = 0;
  bool hasGuessed = false;

  @override
  void initState() {
    hasGuessed = false;
    super.initState();
  }

  Widget buildFutureGameOption(int offset) {
    return FutureBuilder(
        future: _databaseHelper.queryFirstValue(DatabaseHelper.bpmTable),
        initialData: "Loading...",
        builder: (BuildContext context, AsyncSnapshot<String> object) {
          int parsedValue = int.parse(object.data!);
          String displayedOption = (parsedValue + offset).toString();
          return SingleChildScrollView(
              child: ElevatedButton(
                  onPressed: () => _checkIfOptionIsCorrect(offset),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(25),
                    backgroundColor: Colors.pink[300],
                    fixedSize: const Size(80, 80),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        displayedOption,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ))));
        });
  }

  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "Guess Your Heart Rate",
        style: TextStyle(
            fontSize: 30,
            foreground: Paint()
              ..shader = ui.Gradient.linear(
                const Offset(0, 0),
                const Offset(400, 0),
                <Color>[
                  Colors.red,
                  Colors.blue,
                ],
              )),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildGame(BuildContext context) {
    var offset = [0];
    var rand1 = 0;
    var rand2 = 0;
    while (rand1 == 0) {
      rand1 = Random().nextInt(10);
    }
    while (rand2 == 0) {
      rand2 = Random().nextInt(10) * -1;
    }
    offset.add(rand1);
    offset.add(rand2);
    offset.shuffle();
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < offset.length; i++)
              buildFutureGameOption(offset[i])
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            buildTitle(context),
            buildGame(context),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Score: \n$consecutiveRights",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.red
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Visibility(
                visible: hasGuessed,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    displayMessage,
                    style: TextStyle(
                        fontSize: 30,
                        foreground: Paint()
                          ..shader = ui.Gradient.linear(
                            const Offset(0, 0),
                            const Offset(200, 20),
                            <Color>[
                              Colors.green,
                              Colors.blue,
                            ],
                          )),
                    textAlign: TextAlign.center,
                  ),
                )),
          ],
        ));
  }

  void _checkIfOptionIsCorrect(int offset) {
    if (offset == 0) {
      displayMessage = "Correct!";
      consecutiveRights += 1;
    } else if (offset > 0) {
      displayMessage = "Too Large! Oops!";
      consecutiveRights = 0;
    } else {
      displayMessage = "Too small! Try harder!";
      consecutiveRights = 0;
    }
    hasGuessed = true;
    setState(() => {});
  }
}
