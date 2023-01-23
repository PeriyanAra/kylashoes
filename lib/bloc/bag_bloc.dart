import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/view_models/bag_view_model.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

part 'bag_event.dart';
part 'bag_state.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc()
      : super(
          BagState(
            bagViewModel: BagViewModel(
              shoeViewModels: {},
              totalItems: 0,
              totalPrice: 0,
            ),
          ),
        ) {
    on<AddShoes>(_handleAddShoes);
    on<DeleteShoesItem>(_handleDeleteShoesItem);
  }

  Future _handleAddShoes(
    AddShoes event,
    Emitter<BagState> emit,
  ) async {
    Map<int, Map<String, Object>> newShoeViewModels = {
      ...state.bagViewModel.shoeViewModels
    };

    if (newShoeViewModels[event.shoeViewModel.id] == null) {
      newShoeViewModels[event.shoeViewModel.id] = {
        'count': 1,
        'viewModel': event.shoeViewModel,
      };
    } else {
      final count = newShoeViewModels[event.shoeViewModel.id]!['count']! as int;

      newShoeViewModels[event.shoeViewModel.id] = {
        'count': count + 1,
        'viewModel': event.shoeViewModel,
      };
    }

    emit(
      BagState(
        bagViewModel: BagViewModel(
          shoeViewModels: newShoeViewModels,
          totalItems: _getTotalItemCount(newShoeViewModels),
          totalPrice: _getTotalPrice(newShoeViewModels),
        ),
      ),
    );
  }

  Future _handleDeleteShoesItem(
    DeleteShoesItem event,
    Emitter<BagState> emit,
  ) async {
    Map<int, Map<String, Object>> newShoeViewModels = {
      ...state.bagViewModel.shoeViewModels
    };

    final count = newShoeViewModels[event.shoeViewModel.id]!['count']! as int;

    if (count == 1) {
      newShoeViewModels.remove(event.shoeViewModel.id);
    } else {
      newShoeViewModels[event.shoeViewModel.id] = {
        'count': count - 1,
        'viewModel': event.shoeViewModel,
      };
    }

    log(
      newShoeViewModels.toString(),
      name: 'newShoeViewModels',
    );
    emit(
      BagState(
        bagViewModel: BagViewModel(
          shoeViewModels: newShoeViewModels,
          totalItems: _getTotalItemCount(newShoeViewModels),
          totalPrice: _getTotalPrice(newShoeViewModels),
        ),
      ),
    );
  }

  int _getTotalItemCount(
    Map<int, Map<String, Object>> shoeViewModels,
  ) {
    int totalItemCount = 0;

    shoeViewModels.forEach((key, value) {
      final shoeCount = value['count'] as int;

      totalItemCount += shoeCount;
    });

    return totalItemCount;
  }

  double _getTotalPrice(
    Map<int, Map<String, Object>> shoeViewModels,
  ) {
    double totalPrice = 0;

    shoeViewModels.forEach((key, value) {
      final shoeViewModel = value['viewModel'] as ShoeViewModel;
      final shoeCount = value['count'] as int;

      totalPrice += shoeViewModel.price * shoeCount;
    });

    return totalPrice;
  }
}
