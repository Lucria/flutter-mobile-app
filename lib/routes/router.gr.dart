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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart' as _i13;

import '../bluetooth/bluetooth_widget.dart' as _i9;
import '../bluetooth/waveform_widget.dart' as _i10;
import '../home_page.dart' as _i1;
import '../posts/posts_page.dart' as _i5;
import '../posts/single_post_page.dart' as _i6;
import '../relief/relief_page.dart' as _i3;
import '../settings/settings_page.dart' as _i4;
import '../users/user_profile_page.dart' as _i8;
import '../users/users_page.dart' as _i7;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    PostsRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    UsersRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ReliefRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ReliefPage(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsPage(),
      );
    },
    BluetoothRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    PostsRoute.name: (routeData) {
      final args = routeData.argsAs<PostsRouteArgs>(
          orElse: () => const PostsRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.PostsPage(key: args.key),
      );
    },
    SinglePostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SinglePostRouteArgs>(
          orElse: () =>
              SinglePostRouteArgs(postId: pathParams.getInt('postId')));
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.SinglePostPage(
          key: args.key,
          postId: args.postId,
        ),
      );
    },
    UsersRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.UsersPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () =>
              UserProfileRouteArgs(userId: pathParams.getInt('userId')));
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.UserProfilePage(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    BluetoothWidget.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.BluetoothWidget(),
      );
    },
    WaveformWidget.name: (routeData) {
      final args = routeData.argsAs<WaveformWidgetArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.WaveformWidget(
          key: args.key,
          connection: args.connection,
        ),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i11.RouteConfig(
              PostsRouter.name,
              path: 'posts',
              parent: HomeRoute.name,
              children: [
                _i11.RouteConfig(
                  PostsRoute.name,
                  path: '',
                  parent: PostsRouter.name,
                ),
                _i11.RouteConfig(
                  SinglePostRoute.name,
                  path: ':postId',
                  parent: PostsRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              UsersRouter.name,
              path: 'users',
              parent: HomeRoute.name,
              children: [
                _i11.RouteConfig(
                  UsersRoute.name,
                  path: '',
                  parent: UsersRouter.name,
                ),
                _i11.RouteConfig(
                  UserProfileRoute.name,
                  path: ':userId',
                  parent: UsersRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              ReliefRouter.name,
              path: 'relief',
              parent: HomeRoute.name,
            ),
            _i11.RouteConfig(
              SettingsRouter.name,
              path: 'settings',
              parent: HomeRoute.name,
            ),
            _i11.RouteConfig(
              BluetoothRouter.name,
              path: 'bluetooth',
              parent: HomeRoute.name,
              children: [
                _i11.RouteConfig(
                  BluetoothWidget.name,
                  path: '',
                  parent: BluetoothRouter.name,
                ),
                _i11.RouteConfig(
                  WaveformWidget.name,
                  path: 'waveform',
                  parent: BluetoothRouter.name,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PostsRouter extends _i11.PageRouteInfo<void> {
  const PostsRouter({List<_i11.PageRouteInfo>? children})
      : super(
          PostsRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'PostsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class UsersRouter extends _i11.PageRouteInfo<void> {
  const UsersRouter({List<_i11.PageRouteInfo>? children})
      : super(
          UsersRouter.name,
          path: 'users',
          initialChildren: children,
        );

  static const String name = 'UsersRouter';
}

/// generated route for
/// [_i3.ReliefPage]
class ReliefRouter extends _i11.PageRouteInfo<void> {
  const ReliefRouter()
      : super(
          ReliefRouter.name,
          path: 'relief',
        );

  static const String name = 'ReliefRouter';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRouter extends _i11.PageRouteInfo<void> {
  const SettingsRouter()
      : super(
          SettingsRouter.name,
          path: 'settings',
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class BluetoothRouter extends _i11.PageRouteInfo<void> {
  const BluetoothRouter({List<_i11.PageRouteInfo>? children})
      : super(
          BluetoothRouter.name,
          path: 'bluetooth',
          initialChildren: children,
        );

  static const String name = 'BluetoothRouter';
}

/// generated route for
/// [_i5.PostsPage]
class PostsRoute extends _i11.PageRouteInfo<PostsRouteArgs> {
  PostsRoute({_i12.Key? key})
      : super(
          PostsRoute.name,
          path: '',
          args: PostsRouteArgs(key: key),
        );

  static const String name = 'PostsRoute';
}

class PostsRouteArgs {
  const PostsRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'PostsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SinglePostPage]
class SinglePostRoute extends _i11.PageRouteInfo<SinglePostRouteArgs> {
  SinglePostRoute({
    _i12.Key? key,
    required int postId,
  }) : super(
          SinglePostRoute.name,
          path: ':postId',
          args: SinglePostRouteArgs(
            key: key,
            postId: postId,
          ),
          rawPathParams: {'postId': postId},
        );

  static const String name = 'SinglePostRoute';
}

class SinglePostRouteArgs {
  const SinglePostRouteArgs({
    this.key,
    required this.postId,
  });

  final _i12.Key? key;

  final int postId;

  @override
  String toString() {
    return 'SinglePostRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i7.UsersPage]
class UsersRoute extends _i11.PageRouteInfo<void> {
  const UsersRoute()
      : super(
          UsersRoute.name,
          path: '',
        );

  static const String name = 'UsersRoute';
}

/// generated route for
/// [_i8.UserProfilePage]
class UserProfileRoute extends _i11.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i12.Key? key,
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

  final _i12.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i9.BluetoothWidget]
class BluetoothWidget extends _i11.PageRouteInfo<void> {
  const BluetoothWidget()
      : super(
          BluetoothWidget.name,
          path: '',
        );

  static const String name = 'BluetoothWidget';
}

/// generated route for
/// [_i10.WaveformWidget]
class WaveformWidget extends _i11.PageRouteInfo<WaveformWidgetArgs> {
  WaveformWidget({
    _i12.Key? key,
    required _i13.BluetoothConnection connection,
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

  final _i12.Key? key;

  final _i13.BluetoothConnection connection;

  @override
  String toString() {
    return 'WaveformWidgetArgs{key: $key, connection: $connection}';
  }
}
