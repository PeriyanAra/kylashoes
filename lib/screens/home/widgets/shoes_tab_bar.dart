import 'package:flutter/material.dart';
import 'package:kylashoes/screens/home/widgets/shoes_tab_bar_item.dart';

class ShoesTabBar extends StatelessWidget {
  const ShoesTabBar({
    super.key,
    required this.names,
    required this.tabController,
    required this.tabsCount,
  });

  final List<String> names;
  final TabController tabController;
  final int tabsCount;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: TabBar(
        controller: tabController,
        labelPadding: const EdgeInsets.symmetric(horizontal: 25),
        splashFactory: NoSplash.splashFactory,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        tabs: List.generate(
          tabsCount,
          (index) => ShoesTabBarItem(
            index: index,
            tabController: tabController,
            name: names[index],
          ),
        ),
      ),
    );
  }
}
