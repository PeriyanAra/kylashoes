// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AppRouterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AppRouterScreen(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    FavoriteTabRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    BagTabRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    ProfileTabRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
    BagRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BagScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'tabs',
          fullMatch: true,
        ),
        RouteConfig(
          AppRouterRoute.name,
          path: 'tabs',
          children: [
            RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: AppRouterRoute.name,
              children: [
                RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                )
              ],
            ),
            RouteConfig(
              FavoriteTabRouter.name,
              path: 'favorite',
              parent: AppRouterRoute.name,
              children: [
                RouteConfig(
                  FavoriteRoute.name,
                  path: '',
                  parent: FavoriteTabRouter.name,
                )
              ],
            ),
            RouteConfig(
              BagTabRouter.name,
              path: 'bag',
              parent: AppRouterRoute.name,
              children: [
                RouteConfig(
                  BagRoute.name,
                  path: '',
                  parent: BagTabRouter.name,
                )
              ],
            ),
            RouteConfig(
              ProfileTabRouter.name,
              path: 'profile',
              parent: AppRouterRoute.name,
              children: [
                RouteConfig(
                  ProfileRoute.name,
                  path: '',
                  parent: ProfileTabRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [AppRouterScreen]
class AppRouterRoute extends PageRouteInfo<void> {
  const AppRouterRoute({List<PageRouteInfo>? children})
      : super(
          AppRouterRoute.name,
          path: 'tabs',
          initialChildren: children,
        );

  static const String name = 'AppRouterRoute';
}

/// generated route for
/// [EmptyRouterScreen]
class HomeTabRouter extends PageRouteInfo<void> {
  const HomeTabRouter({List<PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [EmptyRouterScreen]
class FavoriteTabRouter extends PageRouteInfo<void> {
  const FavoriteTabRouter({List<PageRouteInfo>? children})
      : super(
          FavoriteTabRouter.name,
          path: 'favorite',
          initialChildren: children,
        );

  static const String name = 'FavoriteTabRouter';
}

/// generated route for
/// [EmptyRouterScreen]
class BagTabRouter extends PageRouteInfo<void> {
  const BagTabRouter({List<PageRouteInfo>? children})
      : super(
          BagTabRouter.name,
          path: 'bag',
          initialChildren: children,
        );

  static const String name = 'BagTabRouter';
}

/// generated route for
/// [EmptyRouterScreen]
class ProfileTabRouter extends PageRouteInfo<void> {
  const ProfileTabRouter({List<PageRouteInfo>? children})
      : super(
          ProfileTabRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileTabRouter';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: '',
        );

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [BagScreen]
class BagRoute extends PageRouteInfo<void> {
  const BagRoute()
      : super(
          BagRoute.name,
          path: '',
        );

  static const String name = 'BagRoute';
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}
