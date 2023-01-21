import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_quantity.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_value.dart';

class BagShoesComponent extends StatefulWidget {
  const BagShoesComponent({super.key});

  @override
  State<BagShoesComponent> createState() => _BagShoesComponentState();
}

class _BagShoesComponentState extends State<BagShoesComponent>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationStatus _animationStatus;

  @override
  void initState() {
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

          log(
            _animationStatus.toString(),
            name: '_animationStatus',
          );
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
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: -14,
                  child: Transform.rotate(
                    angle: -0.3,
                    child: AnimatedOpacity(
                      opacity: _animationStatus == AnimationStatus.forward
                          ? 1
                          : 0,
                      duration: const Duration(milliseconds: 1500),
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        curve: _animationStatus == AnimationStatus.forward
                            ? Curves.elasticOut
                            : Curves.elasticIn,
                        height: _animationStatus == AnimationStatus.forward
                            ? _animation.value + 50
                            : _animation.value + 1,
                        duration: const Duration(milliseconds: 600),
                        child: Image.asset(
                          'assets/images/sneaker_01.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 50),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _animation.value / 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BagShoesValue(
                    child: Text(
                      'NIKE AIR-127',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const BagShoesValue(
                    child: Text(
                      '\$127.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  BagShoesValue(
                    child: BagShoesQuantity(
                      quantity: 1,
                      onMinusPressed: () {
                        _animationController.reverse();
                      },
                      onPlusPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
