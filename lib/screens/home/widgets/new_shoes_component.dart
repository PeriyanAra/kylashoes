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
  bool _isLiked = false;

  @override
  void initState() {
    _isLiked = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 6,
        top: 6,
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
                    Transform.rotate(
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
                    CustomButton(
                      onTap: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                      },
                      child: AnimatedContainer(
                        // color: _isLiked ? Colors.pink : null,
                        duration: const Duration(milliseconds: 600),
                        child: _isLiked
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                              ),
                      ),
                    )
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
