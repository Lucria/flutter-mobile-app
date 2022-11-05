import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';
import 'game_model.dart';
import 'dart:ui' as ui;

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GameState();
}

class GameState extends State<GameWidget> {
  var game = Game(70); // TODO pass in heart rate at certain point
  var displayMessages = "";
  var textEditionController = TextEditingController();

  Widget buildStartGameButton(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: ElevatedButton(
          onPressed: () => showMessage(context, "Start Game"),
          child: const Text('Start Game'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red[400]),
          ),
        ),
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 3; i++)
            ElevatedButton(
              onPressed: () => showMessage(context, i.toString()),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(25),
                backgroundColor: Colors.pink[300],
                fixedSize: const Size(80, 80),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  Random().nextInt(180).toString(), // TODO get actual values
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                )
              )
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            buildTitle(context),
            // TextField(
            //   keyboardType: TextInputType.number,
            //   decoration: const InputDecoration(
            //       hintText: "Guess Your Heart Rate between 50 and 180"),
            //   controller: textEditionController,
            //   onSubmitted: (String input) {
            //     setState(() {
            //       int number = int.parse(input);
            //       Result result = game.nextMove(number);
            //
            //       displayMessages = displayMessages +
            //           "\n" +
            //           number.toString() +
            //           " : " +
            //           result.message;
            //     });
            //     textEditionController.text = "";
            //   },
            // ),
            // Text(displayMessages),
            buildGame(context),
            buildStartGameButton(context),
          ],
        ));
  }
}
