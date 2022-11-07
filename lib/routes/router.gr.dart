// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i17;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart' as _i19;

import '../activity/activity_page.dart' as _i13;
import '../bluetooth/bluetooth_widget.dart' as _i14;
import '../bluetooth/waveform_widget.dart' as _i15;
import '../data/app_data.dart' as _i18;
import '../game/game_widget.dart' as _i10;
import '../home/home_page.dart' as _i11;
import '../home_navigation_widget.dart' as _i8;
import '../login/redirect_widget.dart' as _i3;
import '../login/reset_password_page.dart' as _i4;
import '../login/signin_page.dart' as _i5;
import '../login/signup_page.dart' as _i6;
import '../login/welcome_page.dart' as _i2;
import '../posts/single_post_page.dart' as _i12;
import '../relief/emergency_screen.dart' as _i7;
import '../relief/relief_page.dart' as _i9;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    AuthRedirection.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthRedirection(),
      );
    },
    ResetPassword.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ResetPassword(),
      );
    },
    SignInScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SignInScreen(),
      );
    },
    SignUpScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    EmergencyScreen.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.EmergencyScreen(),
      );
    },
    HomeTabNavigationWidget.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.HomeTabNavigationWidget(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    ActivityRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    ReliefRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ReliefPage(),
      );
    },
    GameRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.GameWidget(),
      );
    },
    BluetoothRouter.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.HomePage(),
      );
    },
    SinglePostRoute.name: (routeData) {
      final args = routeData.argsAs<SinglePostRouteArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.SinglePostPage(
          key: args.key,
          post: args.post,
        ),
      );
    },
    ActivityRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ActivityPage(),
      );
    },
    BluetoothWidget.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.BluetoothWidget(),
      );
    },
    WaveformWidget.name: (routeData) {
      final args = routeData.argsAs<WaveformWidgetArgs>();
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.WaveformWidget(
          key: args.key,
          connection: args.connection,
        ),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i16.RouteConfig(
              WelcomeRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i16.RouteConfig(
              AuthRedirection.name,
              path: 'redirect',
              parent: EmptyRouterRoute.name,
            ),
            _i16.RouteConfig(
              ResetPassword.name,
              path: 'reset',
              parent: EmptyRouterRoute.name,
            ),
            _i16.RouteConfig(
              SignInScreen.name,
              path: 'signIn',
              parent: EmptyRouterRoute.name,
            ),
            _i16.RouteConfig(
              SignUpScreen.name,
              path: 'signUp',
              parent: EmptyRouterRoute.name,
            ),
            _i16.RouteConfig(
              EmergencyScreen.name,
              path: 'emergencyRelief',
              parent: EmptyRouterRoute.name,
            ),
            _i16.RouteConfig(
              HomeTabNavigationWidget.name,
              path: 'home',
              parent: EmptyRouterRoute.name,
              children: [
                _i16.RouteConfig(
                  HomeRouter.name,
                  path: 'posts',
                  parent: HomeTabNavigationWidget.name,
                  children: [
                    _i16.RouteConfig(
                      HomeRoute.name,
                      path: '',
                      parent: HomeRouter.name,
                    ),
                    _i16.RouteConfig(
                      SinglePostRoute.name,
                      path: ':postId',
                      parent: HomeRouter.name,
                    ),
                  ],
                ),
                _i16.RouteConfig(
                  ActivityRouter.name,
                  path: 'users',
                  parent: HomeTabNavigationWidget.name,
                  children: [
                    _i16.RouteConfig(
                      ActivityRoute.name,
                      path: '',
                      parent: ActivityRouter.name,
                    )
                  ],
                ),
                _i16.RouteConfig(
                  ReliefRouter.name,
                  path: 'relief',
                  parent: HomeTabNavigationWidget.name,
                ),
                _i16.RouteConfig(
                  GameRouter.name,
                  path: 'game',
                  parent: HomeTabNavigationWidget.name,
                ),
                _i16.RouteConfig(
                  BluetoothRouter.name,
                  path: 'bluetooth',
                  parent: HomeTabNavigationWidget.name,
                  children: [
                    _i16.RouteConfig(
                      BluetoothWidget.name,
                      path: '',
                      parent: BluetoothRouter.name,
                    ),
                    _i16.RouteConfig(
                      WaveformWidget.name,
                      path: 'waveform',
                      parent: BluetoothRouter.name,
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i16.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i16.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.AuthRedirection]
class AuthRedirection extends _i16.PageRouteInfo<void> {
  const AuthRedirection()
      : super(
          AuthRedirection.name,
          path: 'redirect',
        );

  static const String name = 'AuthRedirection';
}

/// generated route for
/// [_i4.ResetPassword]
class ResetPassword extends _i16.PageRouteInfo<void> {
  const ResetPassword()
      : super(
          ResetPassword.name,
          path: 'reset',
        );

  static const String name = 'ResetPassword';
}

/// generated route for
/// [_i5.SignInScreen]
class SignInScreen extends _i16.PageRouteInfo<void> {
  const SignInScreen()
      : super(
          SignInScreen.name,
          path: 'signIn',
        );

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i16.PageRouteInfo<void> {
  const SignUpScreen()
      : super(
          SignUpScreen.name,
          path: 'signUp',
        );

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.EmergencyScreen]
class EmergencyScreen extends _i16.PageRouteInfo<void> {
  const EmergencyScreen()
      : super(
          EmergencyScreen.name,
          path: 'emergencyRelief',
        );

  static const String name = 'EmergencyScreen';
}

/// generated route for
/// [_i8.HomeTabNavigationWidget]
class HomeTabNavigationWidget extends _i16.PageRouteInfo<void> {
  const HomeTabNavigationWidget({List<_i16.PageRouteInfo>? children})
      : super(
          HomeTabNavigationWidget.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabNavigationWidget';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class HomeRouter extends _i16.PageRouteInfo<void> {
  const HomeRouter({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ActivityRouter extends _i16.PageRouteInfo<void> {
  const ActivityRouter({List<_i16.PageRouteInfo>? children})
      : super(
          ActivityRouter.name,
          path: 'users',
          initialChildren: children,
        );

  static const String name = 'ActivityRouter';
}

/// generated route for
/// [_i9.ReliefPage]
class ReliefRouter extends _i16.PageRouteInfo<void> {
  const ReliefRouter()
      : super(
          ReliefRouter.name,
          path: 'relief',
        );

  static const String name = 'ReliefRouter';
}

/// generated route for
/// [_i10.GameWidget]
class GameRouter extends _i16.PageRouteInfo<void> {
  const GameRouter()
      : super(
          GameRouter.name,
          path: 'game',
        );

  static const String name = 'GameRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class BluetoothRouter extends _i16.PageRouteInfo<void> {
  const BluetoothRouter({List<_i16.PageRouteInfo>? children})
      : super(
          BluetoothRouter.name,
          path: 'bluetooth',
          initialChildren: children,
        );

  static const String name = 'BluetoothRouter';
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i12.SinglePostPage]
class SinglePostRoute extends _i16.PageRouteInfo<SinglePostRouteArgs> {
  SinglePostRoute({
    _i17.Key? key,
    required _i18.Post post,
  }) : super(
          SinglePostRoute.name,
          path: ':postId',
          args: SinglePostRouteArgs(
            key: key,
            post: post,
          ),
        );

  static const String name = 'SinglePostRoute';
}

class SinglePostRouteArgs {
  const SinglePostRouteArgs({
    this.key,
    required this.post,
  });

  final _i17.Key? key;

  final _i18.Post post;

  @override
  String toString() {
    return 'SinglePostRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i13.ActivityPage]
class ActivityRoute extends _i16.PageRouteInfo<void> {
  const ActivityRoute()
      : super(
          ActivityRoute.name,
          path: '',
        );

  static const String name = 'ActivityRoute';
}

/// generated route for
/// [_i14.BluetoothWidget]
class BluetoothWidget extends _i16.PageRouteInfo<void> {
  const BluetoothWidget()
      : super(
          BluetoothWidget.name,
          path: '',
        );

  static const String name = 'BluetoothWidget';
}

/// generated route for
/// [_i15.WaveformWidget]
class WaveformWidget extends _i16.PageRouteInfo<WaveformWidgetArgs> {
  WaveformWidget({
    _i17.Key? key,
    required _i19.BluetoothConnection connection,
  }) : super(
          WaveformWidget.name,
          path: 'waveform',
          args: WaveformWidgetArgs(
            key: key,
            connection: connection,
          ),
        );

  static const String name = 'WaveformWidget';
}

class WaveformWidgetArgs {
  const WaveformWidgetArgs({
    this.key,
    required this.connection,
  });

  final _i17.Key? key;

  final _i19.BluetoothConnection connection;

  @override
  String toString() {
    return 'WaveformWidgetArgs{key: $key, connection: $connection}';
  }
}
