import 'package:flutter/material.dart';
import 'package:kylashoes/screens/item_info/widgets/rounded_image_container.dart';

const imageCount = 4;

class ItemPhotoHorizontalList extends StatelessWidget {
  final List<String> imageUrl;

  const ItemPhotoHorizontalList({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageCount,
        itemBuilder: (context, index) {
          return RoundedImageContainer(
            margin: EdgeInsets.only(
              right: index == imageCount - 1 ? 16 : 0,
              left: index == 0 ? 16 : 0,
            ),
            imageUrl: imageUrl.first,
            isVideo: index == imageCount - 1,
          );
        },
        separatorBuilder: (
          BuildContext context,
          int index,
        ) =>
            const SizedBox(width: 10),
      ),
    );
  }
}
