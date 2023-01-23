import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String text;
  final Function() onTap;

  const CustomAnimatedButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = true;
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            isPressed = false;
          });
        });
        widget.onTap();
      },
      child: AnimatedContainer(
        height: isPressed ? 45 : 50,
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..scale(
            isPressed ? 0.9 : 1.0,
            isPressed ? 0.9 : 1.0,
          ),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          color: isPressed
              ? const Color.fromRGBO(250, 43, 94, 0.7)
              : const Color.fromRGBO(250, 43, 94, 1),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
