import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/data/app_data.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class SinglePostPage extends StatelessWidget {
  final Post post;
  const SinglePostPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: post.color,
      body: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (Chunk chunk in post.articleChunks) ...{
                  pictureCard(chunk.imageLink),
                  postTextContent(chunk.title, chunk.text)
                }
              ]
          ),
        ),
      ])
    );
  }
}
