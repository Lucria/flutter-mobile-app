import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/posts/posts_list_widget.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                        const Color.fromARGB(255, 93, 171, 235), const [
                      Text(
                        '38', // TODO Temperature Display
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        '℃',
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                    roundedStatDisplay(Colors.red, const [
                      Text(
                        '120', // TODO BPM Display
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        'BPM',
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                    roundedStatDisplay(
                        const Color.fromARGB(255, 252, 186, 186), const [
                      Text(
                        '35', // TODO O2 Display
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        '%',
                        style: TextStyle(fontSize: 15),
                      ),
                    ]),
                  ]),
            ),
            // TODO add graph of waveform over here!
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   height: 54,
            //   child: const Text(
            //     "Live Tracker",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(color: Colors.red, fontSize: 25),
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            //   alignment: Alignment.center,
            //   height: 250,
            //   width: 400,
            //   decoration: BoxDecoration(
            //       color: Colors.yellow,
            //       border: Border.all(color: Colors.red, width: 5),
            //       borderRadius: BorderRadius.circular(20), //圆角图片（圆形图片）
            //       image: const DecorationImage(
            //           image: NetworkImage(
            //               "https://wx1.sinaimg.cn/large/007PfBoygy1h7az3d5x0uj30sd0cr74t.jpg"),
            //           fit: BoxFit.cover)),
            // ),
            paddedHeader("Healthy Tips", Colors.red),
            const PostsListWidget()
          ]),
    ]);
  }
}
