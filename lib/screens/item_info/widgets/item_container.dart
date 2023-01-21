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
          child: Container(
            width: 1000,
            height: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1500),
              ),
              color: Color.fromRGBO(223, 162, 144, 1),
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
