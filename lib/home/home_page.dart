import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/posts/posts_list_widget.dart';
import 'package:flutter_mobile_app/util/database.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  String test = "Test";

  Widget buildFutureStatDisplay(String table) {
    return FutureBuilder(
        future: _databaseHelper.queryFirstValue(table),
        initialData: "Loading...",
        builder: (BuildContext context, AsyncSnapshot<String> object) {
          return Text(
            object.data!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: [
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 120,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    roundedStatDisplay(
                        const Color.fromARGB(255, 93, 171, 235), [
                      buildFutureStatDisplay(DatabaseHelper.temperatureTable),
                      const Text(
                        '℃',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ]),
                    roundedStatDisplay(Colors.red, [
                      buildFutureStatDisplay(DatabaseHelper.bpmTable),
                      const Text(
                        'BPM',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ]),
                    roundedStatDisplay(
                        const Color.fromARGB(255, 252, 186, 186), [
                      buildFutureStatDisplay(DatabaseHelper.oxygenTable),
                      const Text(
                        '%',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                    ]),
                  ]),
            ),
            // TODO add information of user here
            paddedHeader("Healthy Tips", Colors.red),
            const PostsListWidget()
          ]),
    ]);
  }
}
