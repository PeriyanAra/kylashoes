import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class NewShoesComponent extends StatefulWidget {
  const NewShoesComponent({
    super.key,
    required this.shoe,
  });

  final ShoeViewModel shoe;

  @override
  State<NewShoesComponent> createState() => _NewShoesComponentState();
}

class _NewShoesComponentState extends State<NewShoesComponent> {


  bool likeButtonPressed = false;
  double buttonSize = 30;

  IconData icon = Icons.favorite_border_rounded;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.only(
        left: 6,
        top:6,
        right: 6,
        bottom: 14,
      ),
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
      height: 240,
      width: MediaQuery.of(context).size.width / 2 - 15,
      child: Stack(
        children: [
          Image.asset(widget.shoe.imagePath),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: buttonSize==30? 0:4.7),
                      child: Transform.rotate(
                        alignment: const Alignment(-0.10, 3.5),
                        angle: -pi * 0.5,
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          color: Colors.pink,
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTapDown: (details) {
                        setState(() {
                          buttonSize = 25;
                        });
                      },
                      onTapUp: (details) {
                        if (buttonSize == 25) {
                          if (icon == Icons.favorite) {
                            setState(() {
                              icon = Icons.favorite_border_rounded;
                            });
                          } else {
                            setState(() {
                              icon = Icons.favorite;
                            });
                          }
                        }
                        setState(() {
                          buttonSize = 30;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 40),
                          child: Icon(
                            icon,
                            color: icon == Icons.favorite
                                ? Colors.pink
                                : Colors.black,
                            size: buttonSize,
                          ),
                        ),
                      ),
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
                Text('\$${widget.shoe.price}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
