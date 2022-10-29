import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter_mobile_app/bluetooth/bluetooth_widget.dart';
import 'package:flutter_mobile_app/bluetooth/waveform_widget.dart';
import 'package:flutter_mobile_app/game/game_widget.dart';
import 'package:flutter_mobile_app/home_page.dart';
import 'package:flutter_mobile_app/posts/posts_page.dart';
import 'package:flutter_mobile_app/posts/single_post_page.dart';
import 'package:flutter_mobile_app/relief/relief_page.dart';
import 'package:flutter_mobile_app/settings/settings_page.dart';
import 'package:flutter_mobile_app/users/user_profile_page.dart';
import 'package:flutter_mobile_app/users/users_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(
        path: 'posts',
        name: 'PostsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: PostsPage,
          ),
          AutoRoute(
            path: ':postId',
            page: SinglePostPage,
          )
        ],
      ),
      AutoRoute(
        path: 'users',
        name: 'UsersRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: UsersPage,
          ),
          AutoRoute(
            path: ':userId',
            page: UserProfilePage,
          ),
        ],
      ),
      AutoRoute(
        path: 'relief',
        name: 'ReliefRouter',
        page: ReliefPage,
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: SettingsPage,
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
  ],
)
class $AppRouter {}
