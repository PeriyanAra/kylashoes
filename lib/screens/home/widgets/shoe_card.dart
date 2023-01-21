import 'package:flutter/material.dart';
import 'package:kylashoes/screens/home/view_models/shoe_view_model.dart';
import 'package:kylashoes/screens/home/widgets/simple_shadow.dart';

class ShoeCard extends StatelessWidget {
  final ShoeViewModel shoeViewModel;
  final Animation<double> animation;
  final double angle;
  final double scale;
  final bool hasPaddingAnimation;

  const ShoeCard({
    super.key,
    required this.shoeViewModel,
    required this.angle,
    required this.scale,
    required this.hasPaddingAnimation,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
            padding: EdgeInsets.only(
              right: hasPaddingAnimation
                  ? animation.value
                  : 10 + (100 * angle).abs(),
              left: 20 + (100 * angle).abs(),
              top: 100 - scale * 25,
              bottom: 100 - scale * 25,
            ),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(
                  3,
                  2,
                  0.002,
                )
                ..rotateY(
                  angle,
                ),
              alignment: Alignment.center,
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: shoeViewModel.backgroundColor,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: -20,
          top: 60,
          child: SimpleShadow(
            offset: const Offset(14, 10),
            sigma: 20,
            opacity: 0.35,
            child: Image.asset(
              shoeViewModel.imagePath,
              width: 250,
            ),
          ),
        ),
      ],
    );
  }
}
