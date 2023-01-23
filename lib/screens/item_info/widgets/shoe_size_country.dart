import 'package:flutter/material.dart';

class ShoeSizeCountry extends StatelessWidget {
  const ShoeSizeCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Size',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'UK',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'USA',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ],
        )
      ],
    );
  }
}
