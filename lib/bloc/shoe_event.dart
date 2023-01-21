part of 'shoe_bloc.dart';

@immutable
abstract class ShoeEvent {}

class GetShoesItemsEvent extends ShoeEvent {
  final ShoeViewModel shoeViewModel;

  GetShoesItemsEvent({required this.shoeViewModel});
}

class DeleteShoesItemEvent extends ShoeEvent {
  final int id;

  DeleteShoesItemEvent({required this.id});
}

class AddToBagEvent extends ShoeEvent {
  final int id;
  final List<ShoeViewModel> viewModel;

  AddToBagEvent({
    required this.viewModel,
    required this.id,
  });
}
