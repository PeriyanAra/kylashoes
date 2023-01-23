import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_animated_button.dart';

class BagBottomStatusBar extends StatelessWidget {
  final double totalPrice;

  const BagBottomStatusBar({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      height: 110,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'TOTAL',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$${totalPrice}0',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CustomAnimatedButton(
              text: 'NEXT',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
