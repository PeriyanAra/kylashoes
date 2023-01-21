import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/image_shadow.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          child: ClipPath(
            clipper: CustumPath(),
            child: Container(
              width: 1000,
              height: 350,
              color: Color.fromRGBO(223, 162, 144, 1),
              // decoration: const BoxDecoration(

              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(1500),
              //   ),
              // ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: ImageShadow(
            offset: const Offset(14, 10),
            sigma: 20,
            opacity: 0.35,
            child: Image.asset(
              imageUrl,
              width: 350,
              height: 350,
            ),
          ),
        ),
      ],
    );
  }
}

class CustumPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
