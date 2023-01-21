import 'package:flutter/material.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_component.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key, required this.shoeViewModel});

  final List<ShoeViewModel> shoeViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 30),
        child: BagAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 25,
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 40,
              ),
              child: BagShoesComponent(
                imageUrl: shoeViewModel[index].imagePath,
                price: shoeViewModel[index].price,
              ),
            );
          },
        ),
      ),
    );
  }
}
