import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/bag_bloc.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_bottom_status_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_component.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({
    super.key,
  });

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _onRemoveShoe(
    int index,
    BuildContext context,
    ShoeViewModel currentShoe,
    int count,
  ) {
    AnimatedList.of(context).removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: SizeTransition(
          key: UniqueKey(),
          sizeFactor: animation,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: BagShoesComponent(
                shoe: currentShoe,
                count: count,
                onRemove: () => _onRemoveShoe(
                  index,
                  context,
                  currentShoe,
                  count,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
                          child: AnimatedList(
                            key: _key,
                            initialItemCount:
                                state.bagViewModel.shoeViewModels.length,
                            itemBuilder: (context, index, animation) {
                              final keys = state
                                  .bagViewModel.shoeViewModels.keys
                                  .toList();

                              final currentShoe =
                                  state.bagViewModel.shoeViewModels[keys[index]]
                                      ?['viewModel'] as ShoeViewModel;

                              final count = state.bagViewModel
                                  .shoeViewModels[keys[index]]?['count'] as int;

                              return FadeTransition(
                                opacity: animation,
                                child: SizeTransition(
                                  key: UniqueKey(),
                                  sizeFactor: animation,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 40,
                                      ),
                                      child: BagShoesComponent(
                                        shoe: currentShoe,
                                        count: count,
                                        onRemove: () => _onRemoveShoe(
                                          index,
                                          context,
                                          currentShoe,
                                          count,
                                        ),
                                      ),
                                    ),
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
