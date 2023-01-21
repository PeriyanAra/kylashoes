import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/image_shadow.dart';

class ItemContainer extends StatelessWidget {
  final String imageHeroTag;
  final String backgroundHeroTag;
  final String imageUrl;
  final Color backgroundColor;

  const ItemContainer({
    super.key,
    required this.imageUrl,
    required this.imageHeroTag,
    required this.backgroundHeroTag,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: imageHeroTag,
        child: ImageShadow(
          offset: const Offset(14, 10),
          sigma: 20,
          opacity: 0.3,
          child: Image.asset(
            imageUrl,
            height: 350,
          ),
        ),
      ),
    );
  }
}
