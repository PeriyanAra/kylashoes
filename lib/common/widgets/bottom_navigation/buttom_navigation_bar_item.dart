import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    required this.icon,
    this.isSelected = false,
    this.lastTab = false,
    super.key,
  });

  final IconData icon;
  final bool isSelected;
  final bool lastTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8,
        right: lastTab ? 8 : 0,
      ),
      height: double.infinity,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Icon(
          icon,
          color: isSelected ? Colors.pink : null,
        ),
      ),
    );
  }
}
