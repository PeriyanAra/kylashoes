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
    StoreTabRouter.name: (routeData) {
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
    StoreRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const StoreScreen(),
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
              StoreTabRouter.name,
              path: 'store',
              parent: AppRouterRoute.name,
              children: [
                RouteConfig(
                  StoreRoute.name,
                  path: '',
                  parent: StoreTabRouter.name,
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
class StoreTabRouter extends PageRouteInfo<void> {
  const StoreTabRouter({List<PageRouteInfo>? children})
      : super(
          StoreTabRouter.name,
          path: 'store',
          initialChildren: children,
        );

  static const String name = 'StoreTabRouter';
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
/// [StoreScreen]
class StoreRoute extends PageRouteInfo<void> {
  const StoreRoute()
      : super(
          StoreRoute.name,
          path: '',
        );

  static const String name = 'StoreRoute';
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
