import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:kylashoes/router/app_router_screen.dart';
import 'package:kylashoes/screens/favorite/favorite_screen.dart';
import 'package:kylashoes/screens/home/home_screen.dart';
import 'package:kylashoes/screens/profile/profile_screen.dart';
import 'package:kylashoes/screens/store/store_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'tabs',
      page: AppRouterScreen,
      initial: true,
      children: [
        AutoRoute(
          path: 'home',
          page: EmptyRouterScreen,
          name: 'HomeTabRouter',
          children: [
            AutoRoute(
              path: '',
              page: HomeScreen,
            ),
          ],
        ),
        AutoRoute(
          path: 'favorite',
          page: EmptyRouterScreen,
          name: 'FavoriteTabRouter',
          children: [
            AutoRoute(
              path: '',
              page: FavoriteScreen,
            ),
          ],
        ),
        AutoRoute(
          path: 'store',
          page: EmptyRouterScreen,
          name: 'StoreTabRouter',
          children: [
            AutoRoute(
              path: '',
              page: StoreScreen,
            ),
          ],
        ),
        AutoRoute(
          path: 'profile',
          page: EmptyRouterScreen,
          name: 'ProfileTabRouter',
          children: [
            AutoRoute(
              path: '',
              page: ProfileScreen,
            ),
          ],
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}