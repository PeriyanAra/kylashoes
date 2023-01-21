import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/image_shadow.dart';
import 'package:kylashoes/screens/home/widgets/shoe_card_main_info.dart';
import 'package:kylashoes/screens/item_info/item_info_screen.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class ShoeCard extends StatefulWidget {
  final ShoeViewModel shoeViewModel;
  final Animation<double> animation;
  final double angle;
  final double scale;
  final bool isPrevious;
  final bool isCurrent;
  final bool isAbsoluteCurrent;
  final bool isForward;

  const ShoeCard({
    super.key,
    required this.shoeViewModel,
    required this.angle,
    required this.scale,
    required this.isPrevious,
    required this.animation,
    required this.isCurrent,
    required this.isAbsoluteCurrent,
    required this.isForward,
  });

  @override
  State<ShoeCard> createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  double cardRotationAngle = 0.0;
  double shoePosition = -21.0;

  @override
  void initState() {
    cardRotationAngle = widget.isCurrent ? -widget.angle : widget.angle;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShoeCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isForward && oldWidget.angle < widget.angle) {
      shoePosition = widget.angle * 300 - 21;
    } else if (!widget.isForward && oldWidget.angle > widget.angle) {
      shoePosition = widget.angle - 21;
    }

    cardRotationAngle = widget.isCurrent ? -widget.angle : widget.angle;
  }

  @override
  Widget build(BuildContext context) {
    cardRotationAngle = widget.isCurrent ? -widget.angle : widget.angle;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ItemInfoScreen(),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) => Container(
              padding: EdgeInsets.only(
                right: widget.isForward
                    ? widget.isPrevious
                        ? widget.animation.value
                        : 20 + (100 * cardRotationAngle).abs()
                    : 20 + (100 * cardRotationAngle).abs(),
                left: 20 + (100 * cardRotationAngle).abs(),
                top: 100 - widget.scale * 25,
                bottom: 100 - widget.scale * 25,
              ),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(
                    3,
                    2,
                    0.002,
                  )
                  ..rotateY(
                    cardRotationAngle,
                  ),
                alignment: Alignment.center,
                child: ShoeCardMainInfo(
                  shoeViewModel: widget.shoeViewModel,
                ),
              ),
            ),
          ),
          Positioned(
            right: widget.isForward
                ? widget.isAbsoluteCurrent
                    ? -21
                    : widget.isCurrent
                        ? shoePosition
                        : widget.isPrevious
                            ? shoePosition
                            : -21
                : widget.isPrevious
                    ? shoePosition
                    : -21,
            top: 80,
            child: Transform.rotate(
              angle: !widget.isCurrent ? -widget.angle : 0,
              alignment: const Alignment(0.5, -0.5),
              child: ImageShadow(
                offset: const Offset(14, 10),
                sigma: 20,
                opacity: 0.35,
                child: Hero(
                  tag: widget.shoeViewModel,
                  child: Image.asset(
                    widget.shoeViewModel.imagePath,
                    width: 250,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
