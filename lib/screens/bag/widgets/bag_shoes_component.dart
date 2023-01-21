import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_value.dart';

class BagShoesComponent extends StatefulWidget {
  const BagShoesComponent({
    super.key,
    required this.imageUrl,
    required this.price,
  });

  final String imageUrl;
  final double price;

  @override
  State<BagShoesComponent> createState() => _BagShoesComponentState();
}

class _BagShoesComponentState extends State<BagShoesComponent>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

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
                  duration: const Duration(milliseconds: 300),
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
                    child: AnimatedContainer(
                      curve: Curves.bounceOut,
                      height: _animation.value + 50,
                      duration: const Duration(milliseconds: 600),
                      child: Image.asset(
                        widget.imageUrl,
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
                      '\$price',
                      style: TextStyle(
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
                          onTap: () {},
                          child: const Text('-'),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          child: const Text('1'),
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

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
