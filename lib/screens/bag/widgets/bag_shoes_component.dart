import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/image_shadow.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_quantity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/bag_bloc.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class BagShoesComponent extends StatelessWidget {
  final ShoeViewModel shoe;
  final int count;
  final VoidCallback onRemove;

  const BagShoesComponent({
    super.key,
    required this.shoe,
    required this.count,
    required,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BagBloc>();

    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 100,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 110,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 225, 234, 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 4,
                  child: Transform.rotate(
                    angle: -0.1,
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: ImageShadow(
                        offset: const Offset(14, 10),
                        sigma: 20,
                        opacity: 0.35,
                        child: Image.asset(
                          shoe.imagePath,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shoe.model,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "\$${shoe.price}0",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                BagShoesQuantity(
                  quantity: count,
                  onMinusPressed: () {
                    _onMinusPressed(bloc);
                  },
                  onPlusPressed: () {
                    _onPlusPressed(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onPlusPressed(BuildContext context) {
    context.read<BagBloc>().add(
          AddShoes(
            shoeViewModel: shoe,
          ),
        );
  }

  Future<void> _onMinusPressed(BagBloc bloc) async {
    bloc.add(
      DeleteShoesItem(
        shoeViewModel: shoe,
      ),
    );

    if (count == 1) onRemove();
  }
}
