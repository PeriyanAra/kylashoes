import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';

class BagBottomStatusBar extends StatelessWidget {
  const BagBottomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
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
              children: const [
                Text(
                  'TOTAL',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$510.40',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CustomButton(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink,
              ),
              height: 40,
              width: MediaQuery.of(context).size.width - 60,
              onTap: () {},
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
