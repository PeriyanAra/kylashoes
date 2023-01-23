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
          onTap: () {
            widget.onMinusPressed();
          },
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(243, 243, 243, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: const Text(
            '-',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 21,
          width: widget.quantity < 10 ? 32 : 46,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: SlideTransition(
            position: _animation,
            child: Text(
              widget.quantity.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        CustomButton(
          onTap: () {
            widget.onPlusPressed();
          },
          decoration: const BoxDecoration(
            color: Color.fromRGBO(243, 243, 243, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 2,
          ),
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
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
