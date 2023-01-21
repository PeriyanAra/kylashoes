import 'package:flutter/material.dart';

import 'buttom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int, {bool notify}) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var _items = <CustomBottomNavigationBarItem>[
    const CustomBottomNavigationBarItem(
      icon: Icons.home,
      isSelected: true,
      lastTab: true,
    ),
    const CustomBottomNavigationBarItem(
      icon: Icons.favorite,
      isSelected: true,
      lastTab: true,
    ),
    const CustomBottomNavigationBarItem(
      icon: Icons.store_mall_directory_sharp,
      isSelected: true,
      lastTab: true,
    ),
    const CustomBottomNavigationBarItem(
      icon: Icons.person,
      isSelected: true,
      lastTab: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).padding.bottom + 40,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          _items.length,
          (index) => Expanded(
            child: GestureDetector(
              child: CustomBottomNavigationBarItem(
                icon: _items[index].icon,
                isSelected: index == widget.currentIndex,
                lastTab: index == _items.length - 1,
              ),
              onTap: () => _onItemTap(index),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTap(int index) {
    widget.onTap.call(
      _items.indexOf(_items[index]),
    );

    final newItems = <CustomBottomNavigationBarItem>[];

    for (var i = 0; i < _items.length; i++) {
      newItems.add(
        CustomBottomNavigationBarItem(
          icon: _items[i].icon,
          isSelected: false,
          lastTab: i == _items.length - 1,
        ),
      );
    }

    newItems[index] = CustomBottomNavigationBarItem(
      icon: _items[index].icon,
      isSelected: true,
    );

    setState(() {
      _items = newItems;
    });
  }
}