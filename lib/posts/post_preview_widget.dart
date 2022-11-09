import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/data/app_data.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';

class PostPreviewTile extends StatelessWidget {
  final Post post;
  final void Function() onTileTap;

  const PostPreviewTile({
    Key? key,
    required this.post,
    required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTileTap,
        child: Column(
          children: [
            pictureCard(post.imageLink),
            postTextContent(post.title, post.articlePreview)
          ],
        ),
      ),
    );
  }
}
