import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc() : super(ShoeInitialState()) {
    on<GetShoesItemsEvent>(_handleGetShoesItemsEvent);
    on<DeleteShoesItemEvent>(_handleDeleteShoesItemEvent);
    on<AddToBagEvent>(_handleAddToBagEvent);
  }
  final shoeViewModels = <ShoeViewModel>[];

  Future _handleAddToBagEvent(
    AddToBagEvent event,
    Emitter<ShoeState> emit,
  ) async {
    // shoeViewModels.add(
    //   event.viewModel[event.id],
    // );

    emit(
      ShoeLoadedState(
        shoeViewModels: shoeViewModels,
      ),
    );

    print(state);
  }

  Future _handleGetShoesItemsEvent(
    GetShoesItemsEvent event,
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

  Future _handleDeleteShoesItemEvent(
    DeleteShoesItemEvent event,
    Emitter<ShoeState> emit,
  ) async {
    shoeViewModels.removeWhere(
      (element) => element.id == event.id,
    );
    emit(
      ShoeLoadedState(shoeViewModels: shoeViewModels),
    );
  }
}
