import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/screens/bag/bag_screen.dart';

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Shoe Added In Bag',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Text(
                'go to bag',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BagScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_right_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
