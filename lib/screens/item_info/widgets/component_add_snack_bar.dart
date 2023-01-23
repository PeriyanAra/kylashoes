import 'package:flutter/material.dart';

class ComponentAddSnackBar {
  ComponentAddSnackBar.show(
    final BuildContext context,
    final Color backgroundColor,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: SizedBox(
          height: 20,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Shoe Added In Bag',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ComponentAddSnackBar.hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
