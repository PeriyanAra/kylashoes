import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/favorite_button.dart';
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

  const ShoeCard({
    super.key,
    required this.shoeViewModel,
    required this.angle,
    required this.scale,
    required this.isPrevious,
    required this.animation,
    required this.isCurrent,
    required this.isAbsoluteCurrent,
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

    if (oldWidget.angle < widget.angle) {
      shoePosition = widget.angle * 300 - 21;
    }

    cardRotationAngle = widget.isCurrent ? -widget.angle : widget.angle;
  }

  @override
  Widget build(BuildContext context) {
    final imageHeroTag = DateTime.now().toString();
    final backgroundHeroTag = '2${DateTime.now().toString()}';

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemInfoScreen(
              shoeViewModel: widget.shoeViewModel,
              imageHeroTag: imageHeroTag,
              backgroundHeroTag: backgroundHeroTag,
            ),
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
                right: widget.isPrevious
                    ? widget.animation.value
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
                child: Hero(
                  tag: backgroundHeroTag,
                  child: Material(
                    color: Colors.transparent,
                    child: ShoeCardMainInfo(
                      shoeViewModel: widget.shoeViewModel,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: widget.isAbsoluteCurrent
                ? -21
                : widget.isCurrent
                    ? shoePosition
                    : widget.isPrevious
                        ? shoePosition
                        : -21,
            top: 80,
            child: Transform.rotate(
              angle: !widget.isCurrent ? -widget.angle : 0,
              alignment: const Alignment(0.5, -0.5),
              child: Hero(
                tag: imageHeroTag,
                child: ImageShadow(
                  offset: const Offset(14, 10),
                  sigma: 20,
                  opacity: 0.35,
                  child: Image.asset(
                    widget.shoeViewModel.imagePath,
                    width: 250,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: 70,
            child: AnimatedOpacity(
              opacity: widget.isAbsoluteCurrent ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: FavoriteButton(
                onTap: () {},
                activeColor: const Color.fromRGBO(255, 255, 255, 1),
                passiveColor: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
