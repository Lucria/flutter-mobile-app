import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cell-O2',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
