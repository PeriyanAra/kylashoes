part of 'shoe_bloc.dart';

@immutable
abstract class ShoeEvent {}

class AddShoes extends ShoeEvent {
  final ShoeViewModel shoeViewModel;

  AddShoes({required this.shoeViewModel});
}

class DeleteShoesItem extends ShoeEvent {
  final int id;

  DeleteShoesItem({required this.id});
}
