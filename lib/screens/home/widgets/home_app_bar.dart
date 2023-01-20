import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: Row(
          children: [
            const Text(
              'Discover',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Spacer(),
            CustomButton(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30)
              ),
              padding: const EdgeInsets.all(2),
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 9),
            CustomButton(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30)
              ),
              padding: const EdgeInsets.all(2),
              onTap: () {},
              child: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: false,
      );
  }
}