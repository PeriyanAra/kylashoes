import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: const Color.fromRGBO(228, 172, 155, 1),
    );
  }
}

// class MyContainer extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(100, 100);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
