part of 'shoe_bloc.dart';

@immutable
abstract class ShoeEvent {}

class GetShoesItems extends ShoeEvent {
  final ShoeViewModel shoeViewModel;

  GetShoesItems({required this.shoeViewModel});
}
class DeleteShoesItem extends ShoeEvent {
  final int id;

  DeleteShoesItem({required this.id});
}
