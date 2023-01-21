import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:kylashoes/router/app_router_screen.dart';
import 'package:kylashoes/screens/bag/bag_screen.dart';
import 'package:kylashoes/screens/favorite/favorite_screen.dart';
import 'package:kylashoes/screens/home/home_screen.dart';
import 'package:kylashoes/screens/profile/profile_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
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
          path: 'bag',
          page: EmptyRouterScreen,
          name: 'BagTabRouter',
          children: [
            AutoRoute(
              path: '',
              page: BagScreen, 
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
      ]
    )
  ],
)
class AppRouter extends _$AppRouter {}
