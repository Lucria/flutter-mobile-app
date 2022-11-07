import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter_mobile_app/bluetooth/bluetooth_widget.dart';
import 'package:flutter_mobile_app/bluetooth/waveform_widget.dart';
import 'package:flutter_mobile_app/game/game_widget.dart';
import 'package:flutter_mobile_app/home/home_page.dart';
import 'package:flutter_mobile_app/home_navigation_widget.dart';
import 'package:flutter_mobile_app/login/redirect_widget.dart';
import 'package:flutter_mobile_app/login/reset_password_page.dart';
import 'package:flutter_mobile_app/login/signin_page.dart';
import 'package:flutter_mobile_app/login/signup_page.dart';
import 'package:flutter_mobile_app/posts/single_post_page.dart';
import 'package:flutter_mobile_app/relief/relief_page.dart';
import 'package:flutter_mobile_app/login/welcome_page.dart';
import 'package:flutter_mobile_app/relief/emergency_screen.dart';
import 'package:flutter_mobile_app/activity/activity_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: EmptyRouterPage, children: [
      AutoRoute(path: '', page: WelcomePage),
      AutoRoute(path: 'redirect', page: AuthRedirection),
      AutoRoute(path: 'reset', page: ResetPassword),
      AutoRoute(path: 'signIn', page: SignInScreen),
      AutoRoute(path: 'signUp', page: SignUpScreen),
      AutoRoute(path: 'emergencyRelief', page: EmergencyScreen),
      AutoRoute(path: 'home', page: HomeTabNavigationWidget, children: [
        AutoRoute(
          path: 'posts',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomePage
            ),
            AutoRoute(
              path: ':postId',
              page: SinglePostPage,
            )
          ],
        ),
        AutoRoute(
          path: 'users',
          name: 'ActivityRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ActivityPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'relief',
          name: 'ReliefRouter',
          page: ReliefPage,
        ),
        AutoRoute(
          path: 'game',
          name: 'GameRouter',
          page: GameWidget,
        ),
        AutoRoute(
            path: 'bluetooth',
            name: 'BluetoothRouter',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                  path: '',
                  page: BluetoothWidget
              ),
              AutoRoute(
                  path: 'waveform',
                  page: WaveformWidget
              )
            ]
        ),
      ]),
    ]),
  ],
)
class $AppRouter {}
