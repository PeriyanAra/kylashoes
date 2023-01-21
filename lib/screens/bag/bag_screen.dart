import 'package:flutter/material.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_component.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 30),
        child: BagAppBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: const [
              BagShoesComponent()
            ],
          ),
        )
      ),
    );
  }
}
