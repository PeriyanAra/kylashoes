import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kylashoes/view_models/shoe_view_model.dart';
import 'package:kylashoes/screens/home/widgets/shoe_card.dart';

class ShoesList extends StatefulWidget {
  const ShoesList({super.key});

  @override
  ShoesListState createState() => ShoesListState();
}

class ShoesListState extends State<ShoesList>
    with SingleTickerProviderStateMixin {
  PageController? pageController;
  late Animation<double> leftPaddingAnimation;
  late AnimationController leftPaddingAnimationController;
  bool isLeftPaddingAnimationStarted = false;

  double viewportFraction = 0.67;

  double? pageOffset = 0;
  bool animationStarted = false;

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
    leftPaddingAnimationController.dispose();

    super.dispose();
  }

  void _setupLeftPaddingAnimation() {
    leftPaddingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    leftPaddingAnimation = Tween<double>(
      begin: 21,
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
        physics: CustomScrollPhysics(),
        itemBuilder: (context, index) {
          final itemIndex = index % shoesViewModels.length;
          double scale = max(
            viewportFraction,
            (1 - (pageOffset! - index).abs()) + viewportFraction,
          );

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
            isPrevious: index == pageOffset!.floor() - 1,
            isCurrent: index == pageOffset?.floor(),
            isAbsoluteCurrent: index == pageOffset,
            angle: angle,
            scale: scale,
          );
        },
      ),
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  bool isGoingLeft = false;

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    isGoingLeft = offset.sign < 0;
    return offset;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    assert(() {
      if (value == position.pixels) {
        throw FlutterError(
            '$runtimeType.applyBoundaryConditions() was called redundantly.\n'
            'The proposed new position, $value, is exactly equal to the current position of the '
            'given ${position.runtimeType}, ${position.pixels}.\n'
            'The applyBoundaryConditions method should only be called when the value is '
            'going to actually change the pixels, otherwise it is redundant.\n'
            'The physics object in question was:\n'
            '  $this\n'
            'The position object in question was:\n'
            '  $position\n');
      }
      return true;
    }());
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      return value - position.pixels;
    }
    if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      return value - position.minScrollExtent;
    }

    if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      return value - position.maxScrollExtent;
    }

    if (!isGoingLeft) {
      return value - position.pixels;
    }
    return 0.0;
  }
}

final shoesViewModels = [
  ShoeViewModel(
    id: 0,
    imagePath: 'assets/images/sneaker_01.png',
    model: 'Air-max',
    price: 130,
    isFavorite: false,
    producer: 'Nike',
    backgroundColor: const Color.fromRGBO(115, 202, 220, 1),
  ),
  ShoeViewModel(
    id: 1,
    imagePath: 'assets/images/sneaker_02.png',
    model: 'Air-270',
    price: 130,
    isFavorite: false,
    producer: 'Nike',
    backgroundColor: const Color.fromRGBO(173, 163, 231, 1),
  ),
  ShoeViewModel(
    id: 2,
    imagePath: 'assets/images/sneaker_03.png',
    model: 'Epic-react',
    price: 130,
    isFavorite: false,
    producer: 'Nike',
    backgroundColor: const Color.fromRGBO(37, 114, 168, 1),
  ),
  ShoeViewModel(
    id: 3,
    imagePath: 'assets/images/sneaker_04.png',
    model: 'Hustle',
    price: 130,
    isFavorite: false,
    producer: 'Nike',
    backgroundColor: const Color.fromRGBO(238, 98, 147, 1),
  ),
];
