import 'package:flutter/material.dart';

class BagShoesValue extends StatefulWidget {
  const BagShoesValue({super.key, this.child});

  final Widget? child;

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
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<Offset>(
      begin: const Offset(50, 0),
      end: Offset.zero,
    ).animate(_animationController);

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
