import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kylashoes/bloc/shoe_bloc.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_value.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';

class BagShoesComponent extends StatefulWidget {
  const BagShoesComponent({
    super.key,
    required this.shoe,
    required this.count,
  });

  final ShoeViewModel shoe;
  final int count;

  @override
  State<BagShoesComponent> createState() => _BagShoesComponentState();
}

class _BagShoesComponentState extends State<BagShoesComponent>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  var _animationStatus = AnimationStatus.forward;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        microseconds: 1500,
      ),
    );

    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
      ..addListener(
        () {
          setState(() {
            _animationStatus = _animationController.status;
          });
        },
      );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  duration: const Duration(milliseconds: 800),
                  height: _animation.value,
                  width: _animation.value,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Transform.rotate(
                    angle: -0.3,
                    child: AnimatedOpacity(
                      opacity:
                          _animationStatus == AnimationStatus.forward ? 0 : 1,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: _animation.value + 30,
                        child: Image.asset(
                          widget.shoe.imagePath,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 50),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _animation.value / 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BagShoesValue(
                    child: Text(
                      widget.shoe.model,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  BagShoesValue(
                    child: Text(
                      widget.shoe.price.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  BagShoesValue(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          color: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          onTap: () {
                            _handleRemove(context);
                          },
                          child: const Text('-'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          child: Text(widget.count.toString()),
                        ),
                        CustomButton(
                          color: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          onTap: () {},
                          child: const Text('+'),
                        ),
                      ],
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

  void _handleRemove(BuildContext context) {
    context.read<ShoeBloc>().add(DeleteShoesItem(
          shoeViewModel: widget.shoe,
        ));
  }
}
