import 'package:flutter/material.dart';

class BagShoesValue extends StatefulWidget {
  const BagShoesValue({
    this.child,
    required this.removable,
    super.key,
  });

  final Widget? child;
  final bool removable;

  @override
  State<BagShoesValue> createState() => _BagShoesValueState();
}

class _BagShoesValueState extends State<BagShoesValue>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<Offset>(
      begin: const Offset(10, 0),
      end: Offset.zero,
    ).animate(_animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );

    _animationController.fling();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _reverseAnimation();

    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }

  void _reverseAnimation() {
    if (widget.removable) {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
