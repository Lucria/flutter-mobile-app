import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/relief/count_down_timer.dart';
import 'package:slide_to_act/slide_to_act.dart';

class EmergencyScreen extends StatefulWidget {


  const EmergencyScreen({ Key? key}) : super(key: key);

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {

  final gandhi = [
    "Happiness is when what you think, what you say and what you do are in harmony.",
    "The weak can never forgive. Forgiveness is the attribute of the strong.",
    "The best way to find yourself is to lose yourself in the service of others.",
    "Live as if you were to die tomorrow. Learn as if you were to live forever.",
    "There is more to life than increasing its speed.",
    "Strength does not come from physical capacity. It comes from an indomitable will.",
  ];

  final countdown = 60 * 30;
  final quoteDuration = 10;

  @override
  _EmergencyScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/forest.jpg',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                CountDownTimer(countdown, (build, seconds)  {
                  int timer = seconds ~/ quoteDuration;
                  int index = timer % gandhi.length;
                  String text = seconds != 0 ? gandhi[index] : "You have completed meditation";
                  int tick = seconds % quoteDuration;
                  bool visible = true;
                  if(tick < 1 || tick > quoteDuration - 1) {
                    visible = false;
                  } else {
                    visible = true;
                  }




                  return AnimatedOpacity(
                    opacity:  visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 20.0),
                      ),
                    ),
                  );
                }),
                CountDownTimer(countdown, (build, seconds)  {

                  int sRaw = seconds % 60;
                  int mRaw = seconds ~/ 60;

                  String s = sRaw.toString().padLeft(2, '0');
                  String m = mRaw.toString().padLeft(2, '0');

                  return Text("$m:$s", style: const TextStyle(

                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 100.0),
                  );
                }),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: const Text(
                          '',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        )
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SlideAction(
                                elevation: 0,
                                innerColor: Colors.white,
                                outerColor: Colors.white.withOpacity(0.5),
                                sliderButtonIcon: const Icon(Icons.lock_open,
                                    color: Color.fromARGB(255, 87, 89, 91)),
                                text: 'Slide to End',
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0),
                                onSubmit: () {
                                  Navigator.pop(context);
                                }))),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}
