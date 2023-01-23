part of 'bag_bloc.dart';

@immutable
abstract class BagEvent {
  const BagEvent();
}

class AddShoes extends BagEvent {
  final ShoeViewModel shoeViewModel;

  const AddShoes({required this.shoeViewModel});
}

class DeleteShoesItem extends BagEvent {
  final ShoeViewModel shoeViewModel;

  const DeleteShoesItem({required this.shoeViewModel});
}
