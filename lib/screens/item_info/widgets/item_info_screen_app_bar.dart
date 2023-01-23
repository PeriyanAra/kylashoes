import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/common/widgets/favorite_button.dart';

class ItemInfoScreenAppBar extends StatelessWidget {
  final Color backgroundColor;
  final String itemName;

  const ItemInfoScreenAppBar({
    required this.itemName,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.white,
                ),
              ),
              Text(
                itemName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  boxShadow: const [
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
                  color: Colors.white.withOpacity(0.3),
                ),
                child: FavoriteButton(
                  onTap: () {},
                  activeColor: const Color.fromRGBO(255, 255, 255, 1),
                  passiveColor: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
