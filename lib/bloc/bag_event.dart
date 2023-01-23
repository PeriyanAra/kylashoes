part of 'bag_bloc.dart';

@immutable
abstract class BagEvent {}

class AddShoes extends BagEvent {
  final ShoeViewModel shoeViewModel;

  AddShoes({required this.shoeViewModel});
}

class DeleteShoesItem extends BagEvent {
  final ShoeViewModel shoeViewModel;

  DeleteShoesItem({required this.shoeViewModel});
}
