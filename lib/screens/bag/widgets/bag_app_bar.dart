import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';

class BagAppBar extends StatelessWidget {
  final int itemsCount;

  const BagAppBar({
    super.key,
    required this.itemsCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: CustomButton(
        onTap: () {
          context.router.pop();
        },
        child: const Icon(
          Icons.keyboard_backspace_rounded,
          color: Colors.black,
        ),
      ),
      flexibleSpace: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        width: MediaQuery.of(context).size.width - 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Bag',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total Items $itemsCount',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
