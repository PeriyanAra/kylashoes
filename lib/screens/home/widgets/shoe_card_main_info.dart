import 'package:flutter/material.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class ShoeCardMainInfo extends StatelessWidget {
  final ShoeViewModel shoeViewModel;

  const ShoeCardMainInfo({
    required this.shoeViewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: shoeViewModel.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shoeViewModel.producer.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
            softWrap: false,
          ),
          Text(
            shoeViewModel.model.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 26,
            ),
            softWrap: false,
            textAlign: TextAlign.left,
            overflow: TextOverflow.fade,
          ),
          Text(
            '\$${shoeViewModel.price}0',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              color: Colors.white,
              Icons.arrow_right_alt_rounded,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
