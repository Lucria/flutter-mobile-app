import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/login/welcome_page.dart';
import 'package:slide_to_act/slide_to_act.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

// TODO merge with relief_page!!!
class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
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
            Container(
                alignment: Alignment.center,
                child: const Text(
                  'Breathing Techniques',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                )),
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
                        text: 'Slide to exit',
                        textStyle: const TextStyle(color: Colors.black, fontSize: 24),
                        onSubmit: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomePage()));
                        }))),
          ],
        ),
      ),
    );
  }
}
