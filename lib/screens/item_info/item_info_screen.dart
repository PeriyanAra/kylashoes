import 'package:flutter/material.dart';
import 'package:kylashoes/screens/item_info/widgets/item_info_screen_app_bar.dart';
import 'package:kylashoes/screens/item_info/widgets/item_container.dart';
import 'package:kylashoes/screens/item_info/widgets/item_photo_horizontal_list.dart';

class ItemInfoScreen extends StatelessWidget {
  const ItemInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ItemInfoScreenAppBar(
          itemName: 'Nike',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ItemContainer(imageUrl: 'assets/images/sneaker_01.png'),
            SizedBox(height: 30),
            ItemPhotoHorizontalList(
              imageUrl: ['assets/images/sneaker_01.png'],
            ),
          ],
        ),
      ),
    );
  }
}
