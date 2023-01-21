import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kylashoes/router/app_router.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

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
          child: GestureDetector(
            onTap: () {
              context.router.push(const ItemInfoRoute());
            },
            child: Image.asset(
              shoeViewModel.imagePath,
            ),
          ),
        ),
      ],
    );
  }
}
