import 'package:flutter/material.dart';

class ShoeViewModel {
  ShoeViewModel({
    required this.imagePath,
    required this.model,
    required this.price,
    required this.isFavorite,
    required this.producer,
    required this.backgroundColor,
  });

  String imagePath;
  String model;
  double price;
  bool isFavorite;
  String producer;
  Color backgroundColor;
}
