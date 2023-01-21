import 'package:flutter/material.dart';
import 'package:kylashoes/screens/home/view_models/shoe_view_model.dart';

class ShoeCard extends StatelessWidget {
  final ShoeViewModel shoeViewModel;
  final Animation<double> animation;
  final double angle;
  final EdgeInsetsGeometry padding;

  const ShoeCard({
    super.key,
    required this.shoeViewModel,
    required this.angle,
    required this.animation,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
            padding: padding,
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
        Positioned.fill(
          left: 50,
          child: Image.asset(
            shoeViewModel.imagePath,
          ),
        ),
      ],
    );
  }
}
