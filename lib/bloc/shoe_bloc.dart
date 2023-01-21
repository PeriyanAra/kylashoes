import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc() : super(ShoeInitialState()) {
    on<GetShoesItems>(_handleGetShoesItems);
    on<DeleteShoesItem>(_handleDeleteShoesItem);
  }
  final shoeViewModels = <ShoeViewModel>[];

  Future _handleGetShoesItems(
    GetShoesItems event,
    Emitter<ShoeState> emit,
  ) async {
    shoeViewModels.add(
      event.shoeViewModel,
    );
    emit(
      ShoeLoadedState(
        shoeViewModels: shoeViewModels,
      ),
    );
  }

  Future _handleDeleteShoesItem(
    DeleteShoesItem event,
    Emitter<ShoeState> emit,
  ) async {
    shoeViewModels
      .removeWhere(
        (element) => element.id == event.id,
      );
    emit(
      ShoeLoadedState(
        shoeViewModels: shoeViewModels
         
      ),
    );
  }
}
