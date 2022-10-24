import 'package:flutter/material.dart';

class ReliefPage extends StatelessWidget {
  const ReliefPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 30,
              ),
              child: Image(
                image: AssetImage('assets/IMG_2655.GIF'),
                height: 250,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text("Button"),
          ),
          Text(
            'Relief Page',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              top: 30,
            ),
            color: Colors.grey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 30,
              ),
              child: Text(
                '''user234

user234@email.com''',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          //Card()
          // child: Image(image: AssetImage('assets/IMG_2655.GIF')),
        ],
      ),
    );
  }
}
