import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/bag_bloc.dart';
import 'package:kylashoes/common/custom_animated_button.dart';
import 'package:kylashoes/screens/item_info/widgets/shoe_description_text.dart';
import 'package:kylashoes/screens/item_info/widgets/shoe_name_and_price.dart';
import 'package:kylashoes/screens/item_info/widgets/shoe_size_country.dart';
import 'package:kylashoes/screens/item_info/widgets/shoe_size_list_view.dart';
import 'package:kylashoes/screens/item_info/widgets/item_container.dart';
import 'package:kylashoes/screens/item_info/widgets/item_info_screen_app_bar.dart';
import 'package:kylashoes/screens/item_info/widgets/item_photo_horizontal_list.dart';
import 'package:kylashoes/screens/item_info/widgets/show_add_component_snack_bar.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class ItemInfoScreen extends StatefulWidget {
  final ShoeViewModel shoeViewModel;
  final String imageHeroTag;
  final String backgroundHeroTag;

  const ItemInfoScreen({
    Key? key,
    required this.shoeViewModel,
    required this.imageHeroTag,
    required this.backgroundHeroTag,
  }) : super(key: key);

  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -250,
              top: -300,
              child: Hero(
                tag: widget.backgroundHeroTag,
                child: Container(
                  width: 700,
                  height: 700,
                  decoration: BoxDecoration(
                    color: widget.shoeViewModel.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: ListView(
                children: [
                  ItemContainer(
                    imageUrl: widget.shoeViewModel.imagePath,
                    imageHeroTag: widget.imageHeroTag,
                    backgroundHeroTag: widget.backgroundHeroTag,
                    backgroundColor: widget.shoeViewModel.backgroundColor,
                  ),
                  const SizedBox(height: 30),
                  ItemPhotoHorizontalList(
                    imageUrl: [widget.shoeViewModel.imagePath],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: const Color.fromRGBO(210, 210, 210, 1),
                            ),
                            const SizedBox(height: 20),
                            ShoeNameAndPrice(
                              price: widget.shoeViewModel.price,
                              model: widget.shoeViewModel.model,
                            ),
                            const SizedBox(height: 20),
                            const ShoeDescriptionText(),
                            const ShoeSizeCountry(),
                            const SizedBox(
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                      const ShoeSizeListView(),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: CustomAnimatedButton(
                          text: 'ADD TO BAG',
                          onTap: () {
                            context.read<BagBloc>().add(
                                  AddShoes(
                                    shoeViewModel: widget.shoeViewModel,
                                  ),
                                );

                            ComponentAddSnackBar.show(
                              context,
                              widget.shoeViewModel.backgroundColor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: ItemInfoScreenAppBar(
                itemName: widget.shoeViewModel.producer,
                backgroundColor: widget.shoeViewModel.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
