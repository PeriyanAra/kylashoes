import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kylashoes/screens/home/view_models/shoe_view_model.dart';
import 'package:kylashoes/screens/home/widgets/shoe_card.dart';

class ShoesList extends StatefulWidget {
  const ShoesList({super.key});

  @override
  ShoesListState createState() => ShoesListState();
}

class ShoesListState extends State<ShoesList> with TickerProviderStateMixin {
  PageController? pageController;

  double viewportFraction = 0.6;

  double? pageOffset = 0;
  bool animationStarted = false;

  late Animation<double> lastMomentumAnimation;
  late AnimationController lastMomentumAnimationController;

  @override
  void initState() {
    super.initState();

    _setupPageController();
    _setupLeftPaddingAnimation();
  }

  void _setupPageController() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: viewportFraction,
    )..addListener(
        () {
          setState(() {
            if (pageOffset!.floor() < pageController!.page!.floor()) {
              isLeftPaddingAnimationStarted = false;
            }
            pageOffset = pageController!.page;
          });
        },
      );
  }

  @override
  void dispose() {
    pageController!.dispose();
    lastMomentumAnimationController.dispose();

    super.dispose();
  }

  late Animation<double> leftPaddingAnimation;
  late AnimationController leftPaddingAnimationController;
  bool isLeftPaddingAnimationStarted = false;

  void _setupLeftPaddingAnimation() {
    leftPaddingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    leftPaddingAnimation = Tween<double>(
      begin: 10,
      end: 100,
    ).animate(leftPaddingAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        controller: pageController,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final itemIndex = index % shoesViewModels.length;
          double scale = max(viewportFraction,
              (1 - (pageOffset! - index).abs()) + viewportFraction);

          double angle = (pageOffset! - index).abs();

          if (angle > 0.5) {
            angle = 1 - angle;
          }

          var a = (pageOffset! - 1 - index).abs();

          if (a < 1.4 && !isLeftPaddingAnimationStarted) {
            leftPaddingAnimationController.forward(from: 0);
            isLeftPaddingAnimationStarted = true;
          }

          return ShoeCard(
            shoeViewModel: shoesViewModels[itemIndex],
            animation: leftPaddingAnimation,
            hasPaddingAnimation: index == pageOffset!.floor() - 1,
            angle: index == pageOffset?.floor() ? -angle : angle,
            scale: scale,
          );
        },
      ),
    );
  }
}

final shoesViewModels = [
  ShoeViewModel(
    imagePath: 'assets/images/sneaker_01.png',
    model: 'Air-max',
    price: 130,
    isFavorite: false,
    producer: 'nike',
    backgroundColor: const Color.fromRGBO(115, 202, 220, 1),
  ),
  ShoeViewModel(
    imagePath: 'assets/images/sneaker_02.png',
    model: 'Air-270',
    price: 130,
    isFavorite: false,
    producer: 'nike',
    backgroundColor: const Color.fromRGBO(173, 163, 231, 1),
  ),
  ShoeViewModel(
    imagePath: 'assets/images/sneaker_03.png',
    model: 'Epic-react',
    price: 130,
    isFavorite: false,
    producer: 'nike',
    backgroundColor: const Color.fromRGBO(37, 114, 168, 1),
  ),
  ShoeViewModel(
    imagePath: 'assets/images/sneaker_04.png',
    model: 'Hustle',
    price: 130,
    isFavorite: false,
    producer: 'nike',
    backgroundColor: const Color.fromARGB(255, 73, 109, 225),
  ),
];
