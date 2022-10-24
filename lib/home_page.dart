import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_app/routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: Colors.red[300],
        title: const Text('Cell-O2'),
        centerTitle: true,
        leading: const AutoLeadingButton(),
      ),
      backgroundColor: Colors.white,
      routes: const [
        PostsRouter(),
        UsersRouter(),
        ReliefRouter(),
        SettingsRouter(),
      ],
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
