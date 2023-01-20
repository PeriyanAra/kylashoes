import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    this.decoration,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.child,
  });

  final void Function() onTap;
  final Decoration? decoration;
  final AlignmentGeometry alignment;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: decoration,
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        color: color,
        child: child ??
            Container(
              height: 30,
              width: 30,
              color: Colors.black,
            ),
      ),
    );
  }
}
