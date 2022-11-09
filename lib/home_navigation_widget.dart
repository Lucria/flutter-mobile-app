import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';
import 'package:flutter_mobile_app/util/util_widgets.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeTabNavigationWidget extends StatelessWidget {
  const HomeTabNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: Colors.red[300],
        title: buildTitle(),
        centerTitle: true,
        leading: const AutoLeadingButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    context.router.popUntilRoot();
                    context.router.parent()!.navigate(const SignInScreen());
                    // sign_in.SignInScreen()));
                  });
                },
                child: const Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  context.navigateTo(const ProfileRouter());
                },
                child: const Icon(
                  Icons.account_circle_outlined,
                  size: 26.0,
                ),
              )
          )
        ],
      ),
      backgroundColor: Colors.white,
      routes: const [
        HomeRouter(),
        ActivityRouter(),
        ReliefRouter(),
        GameRouter(),
        BluetoothRouter(),
        ProfileRouter(),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.navigateTo(const BluetoothRouter()),
        child: const Icon(Icons.monitor_heart),
        backgroundColor: Colors.red[500],
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.red[200],
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.red[200],
              icon: const Icon(
                Icons.bar_chart_rounded,
                size: 30,
              ),
              title: const Text('Activity'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.red[200],
              icon: const Icon(
                Icons.wb_sunny_rounded,
                size: 30,
              ),
              title: const Text('Relief'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.red[200],
              icon: const Icon(
                Icons.rocket_launch_rounded,
                size: 30,
              ),
              title: const Text('Game'),
            ),
          ],
        );
      },
    );
  }
}
