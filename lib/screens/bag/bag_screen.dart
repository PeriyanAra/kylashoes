import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/bag_bloc.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_component.dart';

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
              itemsCount: state.shoeViewModels.length,
            ),
          ),
          body: state.shoeViewModels.isEmpty
              ? const Center(
                  child: Text('No items in bag'),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: ListView.builder(
                    itemCount: state.shoeViewModels.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentShoe =
                          state.shoeViewModels.keys.toList()[index];
                      final count = state.shoeViewModels[currentShoe] as int;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 40,
                        ),
                        child: BagShoesComponent(
                          shoe: currentShoe,
                          count: count,
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
