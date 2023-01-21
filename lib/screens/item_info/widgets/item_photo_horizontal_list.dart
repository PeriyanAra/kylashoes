import 'package:flutter/material.dart';
import 'package:kylashoes/screens/item_info/widgets/rounded_image_container.dart';

class ItemPhotoHorizontalList extends StatelessWidget {
  const ItemPhotoHorizontalList({super.key, required this.imageUrl});
  final List<String> imageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImageContainer(
          imageUrl: imageUrl.first,
        ),
        RoundedImageContainer(
          imageUrl: imageUrl.first,
        ),
        RoundedImageContainer(
          imageUrl: imageUrl.first,
        ),
        Container(
          padding: const EdgeInsets.all(2),
          width: 85,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            image: DecorationImage(
              image: AssetImage(imageUrl.first),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 200, 197, 197).withOpacity(1),
                BlendMode.darken,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
