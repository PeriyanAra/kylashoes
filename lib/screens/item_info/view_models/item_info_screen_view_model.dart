class ItemInfoViewModel {
  ItemInfoViewModel({
    required this.imagePath,
    required this.model,
    required this.price,
    required this.isFavorite,
  });

  String imagePath;
  String model;
  double price;
  bool isFavorite;
}
