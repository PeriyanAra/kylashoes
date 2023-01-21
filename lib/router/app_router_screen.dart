import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/bottom_navigation/buttom_navigation_bar.dart';
import 'package:kylashoes/router/app_router.dart';


class AppRouterScreen extends StatelessWidget {
  const AppRouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeTabRouter(children: [HomeRoute()]),
        FavoriteTabRouter(children: [FavoriteRoute()]),
        BagTabRouter(children: [BagRoute()]),
        ProfileTabRouter(children: [ProfileRoute()]),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          extendBody: true,
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}