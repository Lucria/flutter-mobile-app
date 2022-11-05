import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobile_app/data/app_data.dart';
import 'package:flutter_mobile_app/posts/post_preview_widget.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';

class PostsListWidget extends StatelessWidget {
  const PostsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (Post post in posts)
              PostPreviewTile(
                post: post,
                onTileTap: () => context.router.push(
                  SinglePostRoute(
                    post: post,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
