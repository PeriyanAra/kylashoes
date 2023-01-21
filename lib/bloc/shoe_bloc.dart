import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc()
      : super(
          ShoeState(
            shoeViewModels: [],
          ),
        ) {
    on<AddShoes>(_handleAddShoes);
    on<DeleteShoesItem>(_handleDeleteShoesItem);
  }

  Future _handleAddShoes(
    AddShoes event,
    Emitter<ShoeState> emit,
  ) async {
    List<ShoeViewModel> newShoeViewModels = [...state.shoeViewModels];

    newShoeViewModels.add(
      event.shoeViewModel,
    );
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
    List<ShoeViewModel> newShoeViewModels = [...state.shoeViewModels];

    newShoeViewModels.removeWhere(
      (element) => element.id == event.id,
    );
    emit(
      ShoeState(shoeViewModels: newShoeViewModels),
    );
  }
}
