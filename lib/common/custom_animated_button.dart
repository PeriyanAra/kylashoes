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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        onTapDown: (TapDownDetails details) {
          setState(() {
            isPressed = !isPressed;
          });
        },
        onTapUp: (TapUpDetails details) {
          setState(() {
            isPressed = !isPressed;
          });
          widget.onTap();
        },
        child: AnimatedContainer(
          width: isPressed
              ? MediaQuery.of(context).size.width * .7
              : MediaQuery.of(context).size.width * .8,
          height: isPressed ? 45 : 50,
          duration: const Duration(milliseconds: 80),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: isPressed
                ? const Color.fromARGB(255, 249, 117, 187)
                : const Color.fromRGBO(255, 20, 147, 1),
          ),
          child: Text(
            widget.text,
            style: TextStyle(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
