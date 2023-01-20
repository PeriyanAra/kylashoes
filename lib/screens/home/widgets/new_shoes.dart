import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/screens/home/view_models/shoes_view_model.dart';
import 'package:kylashoes/screens/home/widgets/new_shoes_component.dart';

class NewShoes extends StatefulWidget {
  const NewShoes({super.key});

  @override
  State<NewShoes> createState() => _NewShoesState();
}

class _NewShoesState extends State<NewShoes> {
  final _newShoes = <ShoesViewModel>[
    const ShoesViewModel(
      name: 'NIKE AIR MAX',
      image: 'assets/images/sneaker_01.png',
      price: 170.00,
    ),
    const ShoesViewModel(
      name: 'NIKE AIR FORCE',
      image: 'assets/images/sneaker_04.png',
      price: 130.00,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'More',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              CustomButton(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_right_alt_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              2,
              (index) => NewShoesComponent(shoes: _newShoes[index]),
            ),
          ),
        ],
      ),
    );
  }
}
