import 'package:flutter/material.dart';
import 'package:kylashoes/screens/item_info/widgets/item_container.dart';

class ItemInfoScreen extends StatelessWidget {
  const ItemInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(228, 172, 155, 1),
        title: const Text('Nike'),
      ),
      body: ListView(
        children: [
          const ItemContainer(),
        ],
      ),
    );
  }
}
