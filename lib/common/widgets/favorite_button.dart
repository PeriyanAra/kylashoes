import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color activeColor;
  final Color passiveColor;

  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.activeColor,
    required this.passiveColor,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = true;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            isPressed = false;
            isFavorite = !isFavorite;
          });
        });
        widget.onTap();
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()
          ..scale(
            isPressed ? 0.9 : 1.0,
            isPressed ? 0.9 : 1.0,
          ),
        child: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
          color: isFavorite ? widget.activeColor : widget.passiveColor,
          size: 30,
        ),
      ),
    );
  }
}
