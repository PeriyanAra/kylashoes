class BagViewModel {
  BagViewModel({
    required this.shoeViewModels,
    required this.totalPrice,
    required this.totalItems,
  });

  final Map<int, Map<String, Object>> shoeViewModels;
  final double totalPrice;
  final int totalItems;
}
