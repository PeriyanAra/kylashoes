import 'package:flutter/material.dart';
import 'package:kylashoes/screens/home/view_models/shoe_view_model.dart';
import 'package:kylashoes/common/widgets/image_shadow.dart';
import 'package:kylashoes/screens/home/widgets/shoe_card_main_info.dart';

class ShoeCard extends StatelessWidget {
  final ShoeViewModel shoeViewModel;
  final Animation<double> animation;
  final double angle;
  final double scale;
  final bool isPrevious;
  final bool isCurrent;

  const ShoeCard({
    super.key,
    required this.shoeViewModel,
    required this.angle,
    required this.scale,
    required this.isPrevious,
    required this.animation,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final personalAngle = isCurrent ? -angle : angle;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              right: isPrevious
                  ? animation.value
                  : 20 + (100 * personalAngle).abs(),
              left: 20 + (100 * personalAngle).abs(),
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
                  personalAngle,
                ),
              alignment: Alignment.center,
              child: ShoeCardMainInfo(
                shoeViewModel: shoeViewModel,
              ),
            ),
          ),
          Positioned(
            right: isPrevious ? (animation.value - 21) * 2 : -21,
            top: 80,
            child: Transform.rotate(
              angle: -angle,
              alignment: const Alignment(0.5, -0.5),
              child: ImageShadow(
                offset: const Offset(14, 10),
                sigma: 20,
                opacity: 0.35,
                child: Image.asset(
                  shoeViewModel.imagePath,
                  width: 250,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
