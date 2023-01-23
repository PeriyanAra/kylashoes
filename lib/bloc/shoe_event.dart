part of 'shoe_bloc.dart';

@immutable
abstract class ShoeEvent {
  const ShoeEvent();
}

class AddShoes extends ShoeEvent {
  final ShoeViewModel shoeViewModel;

  const AddShoes({required this.shoeViewModel});
}

class DeleteShoesItem extends ShoeEvent {
  final ShoeViewModel shoeViewModel;

  const DeleteShoesItem({required this.shoeViewModel});
}
