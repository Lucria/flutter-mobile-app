import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: buildTitle(),
        centerTitle: true,
        leading: const AutoLeadingButton(),
      ),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: Image.asset('assets/welcome_cell.gif', fit: BoxFit.fitWidth),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            child: ElevatedButton(
              child: const Text(
                'Login here!',
                style: TextStyle(
                    color: Color.fromARGB(221, 5, 10, 54),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.green;
                    }
                    return const Color.fromARGB(255, 124, 197, 241);
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
              onPressed: () {
                context.navigateTo(const AuthRedirection());
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 60),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
            child: ElevatedButton(
              child: const Text(
                'Emergency Relief',
                style: TextStyle(
                    color: Color.fromARGB(221, 5, 10, 54),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black26;
                    }
                    return const Color.fromARGB(255, 227, 123, 123);
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
              onPressed: () {
                context.navigateTo(const EmergencyScreen());
              },
            ),
          ),
        ]),
      ),
    );
  }
}
