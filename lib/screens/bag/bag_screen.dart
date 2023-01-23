import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/bag_bloc.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_bottom_status_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_component.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagBloc, BagState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 30),
            child: BagAppBar(
              itemsCount: state.bagViewModel.totalItems,
            ),
          ),
          body: state.bagViewModel.shoeViewModels.isEmpty
              ? const Center(
                  child: Text('No items in bag'),
                )
              : Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.bottom -
                        (kToolbarHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.bagViewModel.shoeViewModels.length,
                            itemBuilder: (context, index) {
                              final currentShoe =
                                  state.bagViewModel.shoeViewModels[index]
                                      ?['viewModel'] as ShoeViewModel;
                              final count = state.bagViewModel
                                  .shoeViewModels[index]?['count'] as int;
                              log(
                                count.toString(),
                                name: 'count',
                              );

                              return Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: BagShoesComponent(
                                    shoe: currentShoe,
                                    count: count,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        BagBottomStatusBar(
                          totalPrice: state.bagViewModel.totalPrice,
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
