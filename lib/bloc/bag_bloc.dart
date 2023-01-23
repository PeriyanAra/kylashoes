import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc()
      : super(
          BagState(
            shoeViewModels: {},
          ),
        ) {
    on<AddShoes>(_handleAddShoes);
    on<DeleteShoesItem>(_handleDeleteShoesItem);
  }

  Future _handleAddShoes(
    AddShoes event,
    Emitter<BagState> emit,
  ) async {
    Map<ShoeViewModel, int> newShoeViewModels = {...state.shoeViewModels};

    if (newShoeViewModels[event.shoeViewModel] == null) {
      newShoeViewModels[event.shoeViewModel] = 1;
    } else {
      newShoeViewModels[event.shoeViewModel] =
          newShoeViewModels[event.shoeViewModel]! + 1;
    }

    emit(
      BagState(
        shoeViewModels: newShoeViewModels,
      ),
    );
  }

  Future _handleDeleteShoesItem(
    DeleteShoesItem event,
    Emitter<BagState> emit,
  ) async {
    Map<ShoeViewModel, int> newShoeViewModels = {...state.shoeViewModels};

    if (newShoeViewModels[event.shoeViewModel] == 1) {
      newShoeViewModels.remove(event.shoeViewModel);
    } else {
      newShoeViewModels[event.shoeViewModel] =
          newShoeViewModels[event.shoeViewModel]! - 1;
    }

    emit(
      BagState(shoeViewModels: newShoeViewModels),
    );
  }
}
