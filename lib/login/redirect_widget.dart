import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';
import 'package:flutter_mobile_app/login/auth/auth_service.dart';

class AuthRedirection extends StatelessWidget {
  const AuthRedirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RedirectController();
  }
}

class RedirectController extends StatelessWidget {
  const RedirectController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();

    return StreamBuilder<User?>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          if (signedIn) {
            context.router.navigate(const HomeRoute());
          } else {
            context.router.navigate(const SignInScreen());
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
