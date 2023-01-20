import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kylashoes/screens/home/widgets/tab_content.dart';
import 'package:kylashoes/screens/home/widgets/shoes_tab_bar.dart';

class ShoesTab extends StatefulWidget {
  const ShoesTab({super.key});

  @override
  State<ShoesTab> createState() => _ShoesTabState();
}

class _ShoesTabState extends State<ShoesTab>
    with SingleTickerProviderStateMixin {
  var _shoesModelsTabs = <String>[];
  var _shoesTypeTabs = <String>[];
  late TabController _tabController;

  @override
  void initState() {
    _shoesModelsTabs = ['Nike', 'Addidas', 'Jordan', 'Puma', 'Rebook'];

    _shoesTypeTabs = ['Upcoming', 'Featured', 'New'];

    _tabController = TabController(
      length: _shoesModelsTabs.length,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _shoesModelsTabs.length,
      child: Column(
        children: [
          ShoesTabBar(
            names: _shoesModelsTabs,
            tabController: _tabController,
            tabsCount: _shoesModelsTabs.length,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: List.generate(
                  _shoesTypeTabs.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Transform.rotate(
                        angle: -pi * 0.5,
                        child: Text(
                          _shoesTypeTabs[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: List.generate(
                      _shoesModelsTabs.length,
                      (index) => TabContent(
                        data: _shoesModelsTabs[index],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }
}
