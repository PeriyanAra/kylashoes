import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';

class ItemInfoScreenAppBar extends StatelessWidget {
  const ItemInfoScreenAppBar({super.key, required this.itemName});

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(223, 162, 144, 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
            ),
            Text(
              itemName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman',
              ),
            ),
            CustomButton(
              onTap: () { },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 24,
                        offset: Offset(0, 8),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 24,
                        offset: Offset(0, 8),
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(213, 164, 153, 1)),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
