import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/image_shadow.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_quantity.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_value.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/bag_bloc.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class BagShoesComponent extends StatefulWidget {
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
  State<BagShoesComponent> createState() => _BagShoesComponentState();
}

class _BagShoesComponentState extends State<BagShoesComponent>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationStatus _animationStatus;
  late BagBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<BagBloc>();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        microseconds: 800,
      ),
    );

    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
      ..addListener(
        () {
          setState(() {});
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.forward) {
            _animationStatus = status;
          } else if (status == AnimationStatus.reverse) {
            _animationStatus = status;
          }
        },
      );

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  height: _animation.value,
                  width: _animation.value,
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
                    child: AnimatedOpacity(
                      opacity:
                          _animationStatus == AnimationStatus.forward ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        curve: _animationStatus == AnimationStatus.forward
                            ? Curves.elasticOut
                            : Curves.linear,
                        height: _animationStatus == AnimationStatus.forward
                            ? _animation.value + 50
                            : _animation.value + 1,
                        duration: const Duration(milliseconds: 500),
                        child: ImageShadow(
                          offset: const Offset(6, 20),
                          sigma: 20,
                          opacity: 0.4,
                          child: Image.asset(
                            widget.shoe.imagePath,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 70),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _animation.value / 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BagShoesValue(
                    isRemoved: _animationStatus == AnimationStatus.reverse,
                    child: Text(
                      widget.shoe.model,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  BagShoesValue(
                    isRemoved: _animationStatus == AnimationStatus.reverse,
                    child: Text(
                      "\$${widget.shoe.price}0",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  BagShoesValue(
                    isRemoved: _animationStatus == AnimationStatus.reverse,
                    child: BagShoesQuantity(
                      quantity: widget.count,
                      onMinusPressed: () {
                        _onMinusPressed();
                      },
                      onPlusPressed: () {
                        _onPlusPressed(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPlusPressed(BuildContext context) {
    context.read<BagBloc>().add(
          AddShoes(
            shoeViewModel: widget.shoe,
          ),
        );
  }

  Future<void> _onMinusPressed() async {
    if (widget.count == 1) {
      // _animationController.reverse();

      // await Future.delayed(
      //   const Duration(seconds: 1),
      // );
      widget.onRemove();
    }
    _bloc.add(
      DeleteShoesItem(
        shoeViewModel: widget.shoe,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
