import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/shoe_bloc.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_component.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoeBloc, ShoeState>(
      builder: (context, state) {
        if (state is ShoeInitialState) {
          return const Center(child: Text('There is not added items'));
        }
        if (state is ShoeLoadedState) {
          return Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 30),
              child: BagAppBar(),
            ),
            body: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: ListView.builder(
                  itemCount: state.shoeViewModels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 40,
                      ),
                      child: BagShoesComponent(
                        imageUrl: state.shoeViewModels[index].imagePath,
                        price: state.shoeViewModels[index].price,
                      ),
                    );
                  },
                )),
          );
        }
        return Container();
      },
    );
  }
}
