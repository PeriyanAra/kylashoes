import 'package:flutter/material.dart';

class RoundedImageContainer extends StatelessWidget {
  final String imageUrl;
  final bool isVideo;
  final EdgeInsetsGeometry? margin;

  const RoundedImageContainer({
    required this.imageUrl,
    this.isVideo = false,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 65,
      margin: margin,
      decoration: BoxDecoration(
        color: isVideo
            ? const Color.fromRGBO(188, 188, 188, 1)
            : const Color.fromRGBO(245, 245, 245, 1),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: isVideo
              ? ColorFilter.mode(
                  const Color.fromARGB(255, 200, 197, 197).withOpacity(1),
                  BlendMode.darken,
                )
              : null,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isVideo
          ? const Center(
              child: Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.white,
                size: 30,
              ),
            )
          : null,
    );
  }
}
