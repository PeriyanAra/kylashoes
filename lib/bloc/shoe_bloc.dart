import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc()
      : super(
          const ShoeState(
            shoeViewModels: {},
          ),
        ) {
    on<AddShoes>(_handleAddShoes);
    on<DeleteShoesItem>(_handleDeleteShoesItem);
  }

  Future _handleAddShoes(
    AddShoes event,
    Emitter<ShoeState> emit,
  ) async {
    Map<ShoeViewModel, int> newShoeViewModels = {...state.shoeViewModels};

    if (newShoeViewModels[event.shoeViewModel] == null) {
      newShoeViewModels[event.shoeViewModel] = 1;
    } else {
      newShoeViewModels[event.shoeViewModel] =
          newShoeViewModels[event.shoeViewModel]! + 1;
    }

    emit(
      ShoeState(
        shoeViewModels: newShoeViewModels,
      ),
    );
  }

  Future _handleDeleteShoesItem(
    DeleteShoesItem event,
    Emitter<ShoeState> emit,
  ) async {
    Map<ShoeViewModel, int> newShoeViewModels = {...state.shoeViewModels};

    if (newShoeViewModels[event.shoeViewModel] == 1) {
      newShoeViewModels.remove(event.shoeViewModel);
    } else {
      newShoeViewModels[event.shoeViewModel] =
          newShoeViewModels[event.shoeViewModel]! - 1;
    }

    emit(
      ShoeState(shoeViewModels: newShoeViewModels),
    );
  }
}
