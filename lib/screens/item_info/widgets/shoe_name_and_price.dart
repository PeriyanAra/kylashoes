import 'package:flutter/material.dart';

class ShoeNameAndPrice extends StatelessWidget {
  final double price;
  final String model;
  const ShoeNameAndPrice({
    Key? key,
    required this.price,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          model,
          style: const TextStyle(
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
                    color: const Color.fromRGBO(240, 228, 234, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 10,
                  width: '\$${price}0'.length * 15,
                ),
              ),
              Text(
                '\$${price}0',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
