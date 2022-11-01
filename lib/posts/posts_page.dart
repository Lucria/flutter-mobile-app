import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobile_app/data/app_data.dart';
import 'package:flutter_mobile_app/posts/post_tile_widget.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);
  final posts = Post.posts;
  final user = FirebaseAuth.instance.currentUser;

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
            Text(user != null ? 'Signed in as: ' + user!.email! : ""),
            ElevatedButton(
              child: const Text("Logout"),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  context.router.parent()!.navigate(const SignInScreen());
                  // sign_in.SignInScreen()));
                });
              },
            ),
            for (int i = 0; i < posts.length; i++)
              PostTile(
                tileColor: posts[i].color,
                postTitle: posts[i].title,
                onTileTap: () => context.router.push(
                  SinglePostRoute(
                    postId: posts[i].id,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
