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
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i18;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart' as _i20;

import '../bluetooth/bluetooth_widget.dart' as _i15;
import '../bluetooth/waveform_widget.dart' as _i16;
import '../data/app_data.dart' as _i19;
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
import '../users/user_profile_page.dart' as _i14;
import '../users/users_page.dart' as _i13;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
      );
    },
    AuthRedirection.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthRedirection(),
      );
    },
    ResetPassword.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ResetPassword(),
      );
    },
    SignInScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SignInScreen(),
      );
    },
    SignUpScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    EmergencyScreen.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.EmergencyScreen(),
      );
    },
    HomeTabNavigationWidget.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.HomeTabNavigationWidget(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    ActivityRouter.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    ReliefRouter.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ReliefPage(),
      );
    },
    GameRouter.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.GameWidget(),
      );
    },
    BluetoothRouter.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.HomePage(),
      );
    },
    SinglePostRoute.name: (routeData) {
      final args = routeData.argsAs<SinglePostRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.SinglePostPage(
          key: args.key,
          post: args.post,
        ),
      );
    },
    UsersRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.UsersPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () =>
              UserProfileRouteArgs(userId: pathParams.getInt('userId')));
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.UserProfilePage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    BluetoothWidget.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.BluetoothWidget(),
      );
    },
    WaveformWidget.name: (routeData) {
      final args = routeData.argsAs<WaveformWidgetArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.WaveformWidget(
          key: args.key,
          connection: args.connection,
        ),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i17.RouteConfig(
              WelcomeRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              AuthRedirection.name,
              path: 'redirect',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              ResetPassword.name,
              path: 'reset',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              SignInScreen.name,
              path: 'signIn',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              SignUpScreen.name,
              path: 'signUp',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              EmergencyScreen.name,
              path: 'emergencyRelief',
              parent: EmptyRouterRoute.name,
            ),
            _i17.RouteConfig(
              HomeTabNavigationWidget.name,
              path: 'home',
              parent: EmptyRouterRoute.name,
              children: [
                _i17.RouteConfig(
                  HomeRouter.name,
                  path: 'posts',
                  parent: HomeTabNavigationWidget.name,
                  children: [
                    _i17.RouteConfig(
                      HomeRoute.name,
                      path: '',
                      parent: HomeRouter.name,
                    ),
                    _i17.RouteConfig(
                      SinglePostRoute.name,
                      path: ':postId',
                      parent: HomeRouter.name,
                    ),
                  ],
                ),
                _i17.RouteConfig(
                  ActivityRouter.name,
                  path: 'users',
                  parent: HomeTabNavigationWidget.name,
                  children: [
                    _i17.RouteConfig(
                      UsersRoute.name,
                      path: '',
                      parent: ActivityRouter.name,
                    ),
                    _i17.RouteConfig(
                      UserProfileRoute.name,
                      path: ':userId',
                      parent: ActivityRouter.name,
                    ),
                  ],
                ),
                _i17.RouteConfig(
                  ReliefRouter.name,
                  path: 'relief',
                  parent: HomeTabNavigationWidget.name,
                ),
                _i17.RouteConfig(
                  GameRouter.name,
                  path: 'game',
                  parent: HomeTabNavigationWidget.name,
                ),
                _i17.RouteConfig(
                  BluetoothRouter.name,
                  path: 'bluetooth',
                  parent: HomeTabNavigationWidget.name,
                  children: [
                    _i17.RouteConfig(
                      BluetoothWidget.name,
                      path: '',
                      parent: BluetoothRouter.name,
                    ),
                    _i17.RouteConfig(
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
class EmptyRouterRoute extends _i17.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i17.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomeRoute extends _i17.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.AuthRedirection]
class AuthRedirection extends _i17.PageRouteInfo<void> {
  const AuthRedirection()
      : super(
          AuthRedirection.name,
          path: 'redirect',
        );

  static const String name = 'AuthRedirection';
}

/// generated route for
/// [_i4.ResetPassword]
class ResetPassword extends _i17.PageRouteInfo<void> {
  const ResetPassword()
      : super(
          ResetPassword.name,
          path: 'reset',
        );

  static const String name = 'ResetPassword';
}

/// generated route for
/// [_i5.SignInScreen]
class SignInScreen extends _i17.PageRouteInfo<void> {
  const SignInScreen()
      : super(
          SignInScreen.name,
          path: 'signIn',
        );

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i17.PageRouteInfo<void> {
  const SignUpScreen()
      : super(
          SignUpScreen.name,
          path: 'signUp',
        );

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.EmergencyScreen]
class EmergencyScreen extends _i17.PageRouteInfo<void> {
  const EmergencyScreen()
      : super(
          EmergencyScreen.name,
          path: 'emergencyRelief',
        );

  static const String name = 'EmergencyScreen';
}

/// generated route for
/// [_i8.HomeTabNavigationWidget]
class HomeTabNavigationWidget extends _i17.PageRouteInfo<void> {
  const HomeTabNavigationWidget({List<_i17.PageRouteInfo>? children})
      : super(
          HomeTabNavigationWidget.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabNavigationWidget';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class HomeRouter extends _i17.PageRouteInfo<void> {
  const HomeRouter({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ActivityRouter extends _i17.PageRouteInfo<void> {
  const ActivityRouter({List<_i17.PageRouteInfo>? children})
      : super(
          ActivityRouter.name,
          path: 'users',
          initialChildren: children,
        );

  static const String name = 'ActivityRouter';
}

/// generated route for
/// [_i9.ReliefPage]
class ReliefRouter extends _i17.PageRouteInfo<void> {
  const ReliefRouter()
      : super(
          ReliefRouter.name,
          path: 'relief',
        );

  static const String name = 'ReliefRouter';
}

/// generated route for
/// [_i10.GameWidget]
class GameRouter extends _i17.PageRouteInfo<void> {
  const GameRouter()
      : super(
          GameRouter.name,
          path: 'game',
        );

  static const String name = 'GameRouter';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class BluetoothRouter extends _i17.PageRouteInfo<void> {
  const BluetoothRouter({List<_i17.PageRouteInfo>? children})
      : super(
          BluetoothRouter.name,
          path: 'bluetooth',
          initialChildren: children,
        );

  static const String name = 'BluetoothRouter';
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i12.SinglePostPage]
class SinglePostRoute extends _i17.PageRouteInfo<SinglePostRouteArgs> {
  SinglePostRoute({
    _i18.Key? key,
    required _i19.Post post,
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

  final _i18.Key? key;

  final _i19.Post post;

  @override
  String toString() {
    return 'SinglePostRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i13.UsersPage]
class UsersRoute extends _i17.PageRouteInfo<void> {
  const UsersRoute()
      : super(
          UsersRoute.name,
          path: '',
        );

  static const String name = 'UsersRoute';
}

/// generated route for
/// [_i14.UserProfilePage]
class UserProfileRoute extends _i17.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i18.Key? key,
    required int userId,
  }) : super(
          UserProfileRoute.name,
          path: ':userId',
          args: UserProfileRouteArgs(
            key: key,
            userId: userId,
          ),
          rawPathParams: {'userId': userId},
        );

  static const String name = 'UserProfileRoute';
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    this.key,
    required this.userId,
  });

  final _i18.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i15.BluetoothWidget]
class BluetoothWidget extends _i17.PageRouteInfo<void> {
  const BluetoothWidget()
      : super(
          BluetoothWidget.name,
          path: '',
        );

  static const String name = 'BluetoothWidget';
}

/// generated route for
/// [_i16.WaveformWidget]
class WaveformWidget extends _i17.PageRouteInfo<WaveformWidgetArgs> {
  WaveformWidget({
    _i18.Key? key,
    required _i20.BluetoothConnection connection,
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

  final _i18.Key? key;

  final _i20.BluetoothConnection connection;

  @override
  String toString() {
    return 'WaveformWidgetArgs{key: $key, connection: $connection}';
  }
}
