part of 'shoe_bloc.dart';

@immutable
abstract class ShoeState {}

class ShoeInitialState extends ShoeState {}

class ShoeLoadingState extends ShoeState {}

class ShoeLoadedState extends ShoeState {
  final List<ShoeViewModel> shoeViewModels;

 ShoeLoadedState({required this.shoeViewModels});
}
