import 'package:flutter/material.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_description_text.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_name_and_price.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_size_country.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_size_list_view.dart';
import 'package:kylashoes/screens/item_info/widgets/item_info_screen_app_bar.dart';
import 'package:kylashoes/screens/item_info/widgets/item_container.dart';
import 'package:kylashoes/screens/item_info/widgets/item_photo_horizontal_list.dart';

class ItemInfoScreen extends StatefulWidget {
  const ItemInfoScreen({super.key});

  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
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
          children: [
            const ItemContainer(imageUrl: 'assets/images/sneaker_01.png'),
            const SizedBox(height: 30),
            const ItemPhotoHorizontalList(
              imageUrl: ['assets/images/sneaker_01.png'],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(171, 206, 202, 202),
                        width: 1,
                      ),
                    ),
                  ),
                  const BootsNameAndPrice(),
                  const BootsDescriptionText(),
                  const BootsSizeCountry(),
                  const SizedBox(height: 12.0),
                  const BootsSizeListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
