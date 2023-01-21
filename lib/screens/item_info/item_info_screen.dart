import 'package:flutter/material.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_description_text.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_name_and_price.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_size_country.dart';
import 'package:kylashoes/screens/item_info/widgets/boots_size_list_view.dart';
import 'package:kylashoes/screens/item_info/widgets/item_container.dart';
import 'package:kylashoes/screens/item_info/widgets/item_info_screen_app_bar.dart';
import 'package:kylashoes/screens/item_info/widgets/item_photo_horizontal_list.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class ItemInfoScreen extends StatefulWidget {
  final ShoeViewModel shoeViewModel;
  const ItemInfoScreen({
    Key? key,
    required this.shoeViewModel,
  }) : super(key: key);

  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ItemInfoScreenAppBar(
          itemName: widget.shoeViewModel.producer,
        ),
      ),
      body: ListView(
        children: [
           ItemContainer(imageUrl:widget.shoeViewModel.imagePath),
          const SizedBox(height: 30),
           ItemPhotoHorizontalList(
            imageUrl: [widget.shoeViewModel.imagePath],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                BootsNameAndPrice(price: widget.shoeViewModel.price, model: widget.shoeViewModel.model,),
                const BootsDescriptionText(),
                const BootsSizeCountry(),
                const SizedBox(
                  height: 12.0,
                ),
                const BootsSizeListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
