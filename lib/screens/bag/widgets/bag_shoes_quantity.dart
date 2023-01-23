import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';

class BagShoesQuantity extends StatefulWidget {
  const BagShoesQuantity({
    super.key,
    required this.quantity,
    required this.onPlusPressed,
    required this.onMinusPressed,
  });

  final int quantity;
  final void Function() onPlusPressed;
  final void Function() onMinusPressed;

  @override
  State<BagShoesQuantity> createState() => _BagShoesQuantityState();
}

class _BagShoesQuantityState extends State<BagShoesQuantity>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onTap: widget.onMinusPressed,
          color: Colors.grey[300],
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          child: const Text('-'),
        ),
        Container(
          alignment: Alignment.center,
          height: 21,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: SlideTransition(
            position: _animation,
            child: Text(
              widget.quantity.toString(),
            ),
          ),
        ),
        CustomButton(
          onTap: () {
            widget.onPlusPressed();

            // _animationController.fling();

            // _animation = Tween<Offset>(
            //   begin: const Offset(0, -1),
            //   end: const Offset(0, 0),
            // ).animate(_animationController);

            // _animationController.forward();
          },
          color: Colors.grey[300],
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          child: const Text('+'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
