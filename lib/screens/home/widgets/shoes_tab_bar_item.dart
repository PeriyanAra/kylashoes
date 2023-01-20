import 'package:flutter/material.dart';

class ShoesTabBarItem extends StatefulWidget {
  const ShoesTabBarItem({
    super.key,
    required this.name,
    required this.tabController,
    required this.index,
  });

  final String name;
  final TabController tabController;
  final int index;

  @override
  State<ShoesTabBarItem> createState() => _ShoesTabBarItemState();
}

class _ShoesTabBarItemState extends State<ShoesTabBarItem> {
  bool _isActive = false;

  @override
  void initState() {
    _isActive = widget.tabController.index == widget.index;

    widget.tabController.addListener(() {
      setState(() {
        _isActive = widget.tabController.index == widget.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          bottom: 1,
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              color: _isActive ? Colors.grey[300] : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 9,
            width: _isActive ? widget.name.length * 14 : 10,
          ),
        ),
        Text(
          widget.name,
          style: TextStyle(
            color: _isActive ? Colors.black : Colors.grey[400],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
