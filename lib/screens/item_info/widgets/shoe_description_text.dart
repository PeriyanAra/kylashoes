import 'package:flutter/material.dart';

class ShoeDescriptionText extends StatelessWidget {
  const ShoeDescriptionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'The Nike Air Max 270 amps up an icon with a huge Max Air unit for cushioning under every step. If features a stretchy inner sleeve for a snug, sock-like fit.',
          style: TextStyle(color: Colors.grey[400]),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black)),
            ),
            child: const Text(
              'MORE DETAILS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
