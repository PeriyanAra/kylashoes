import 'package:flutter/material.dart';

class ShoeViewModel {
  ShoeViewModel({
    required this.id,
    required this.imagePath,
    required this.model,
    required this.price,
    required this.isFavorite,
    required this.producer,
    required this.backgroundColor,
  });

  final int id;
  final String imagePath;
  final String model;
  final double price;
  final bool isFavorite;
  final String producer;
  final Color backgroundColor;
}
