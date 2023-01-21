import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/screens/home/view_models/shoe_view_model.dart';
import 'package:kylashoes/screens/home/widgets/new_shoes_component.dart';

class NewShoes extends StatefulWidget {
  const NewShoes({super.key});

  @override
  State<NewShoes> createState() => _NewShoesState();
}

class _NewShoesState extends State<NewShoes> {
  final _newShoes = <ShoeViewModel>[
    ShoeViewModel(
      imagePath: 'assets/images/sneaker_01.png',
      model: 'Air-max',
      price: 130,
      isFavorite: false,
      producer: 'nike',
      backgroundColor: const Color.fromRGBO(115, 202, 220, 1),
    ),
    ShoeViewModel(
      imagePath: 'assets/images/sneaker_02.png',
      model: 'Air-270',
      price: 130,
      isFavorite: false,
      producer: 'nike',
      backgroundColor: const Color.fromRGBO(173, 163, 231, 1),
    ),
    ShoeViewModel(
      imagePath: 'assets/images/sneaker_03.png',
      model: 'Epic-react',
      price: 130,
      isFavorite: false,
      producer: 'nike',
      backgroundColor: const Color.fromRGBO(37, 114, 168, 1),
    ),
    ShoeViewModel(
      imagePath: 'assets/images/sneaker_04.png',
      model: 'Hustle',
      price: 130,
      isFavorite: false,
      producer: 'nike',
      backgroundColor: const Color.fromARGB(255, 73, 109, 225),
    ),
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
              (index) => NewShoesComponent(
                shoe: _newShoes[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
