part of 'shoe_bloc.dart';

@immutable
abstract class ShoeState {}

class ShoeInitial extends ShoeState {}

class ShoeLoading extends ShoeState {}

class ShoeLoaded extends ShoeState {
  final List<ShoeViewModel> shoeViewModels;

 ShoeLoaded({required this.shoeViewModels});
}
