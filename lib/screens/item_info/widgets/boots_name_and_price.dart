import 'package:flutter/material.dart';

class BootsNameAndPrice extends StatelessWidget {
  const BootsNameAndPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Air-Max-270',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 9,
                    width: '\$150.00'.length * 15,
                  ),
                ),
                const Text(
                  '\$150.00',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
