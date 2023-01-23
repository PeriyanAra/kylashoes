import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/favorite_button.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class NewShoesComponent extends StatefulWidget {
  final ShoeViewModel shoe;
  final EdgeInsetsGeometry? margin;

  const NewShoesComponent({
    super.key,
    required this.shoe,
    this.margin,
  });

  @override
  State<NewShoesComponent> createState() => _NewShoesComponentState();
}

class _NewShoesComponentState extends State<NewShoesComponent> {
  bool likeButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 6,
        top: 6,
        right: 6,
        bottom: 14,
      ),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            color: Colors.grey[200]!,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      height: 210,
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  widget.shoe.imagePath,
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      alignment: const Alignment(-0.10, 3.5),
                      angle: -pi * 0.5,
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        color: const Color.fromRGBO(250, 43, 94, 1),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    FavoriteButton(
                      onTap: () {},
                      activeColor: const Color.fromRGBO(250, 43, 94, 1),
                      passiveColor: const Color.fromRGBO(34, 34, 34, 1),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.shoe.model,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 9),
                Text('\$${widget.shoe.price}0')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
