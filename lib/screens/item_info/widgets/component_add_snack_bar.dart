import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/router/app_router.dart';

class ComponentAddSnackBar {
  ComponentAddSnackBar.show(
    final BuildContext context,
    final Color backgroundColor,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: SizedBox(
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Shoe Added In Bag',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  context.router.navigate(
                    const AppRouterRoute(
                      children: [
                        StoreTabRouter(
                          children: [
                            BagRoute(),
                          ],
                        ),
                      ],
                    ),
                  );

                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Row(
                  children: const [
                    Text(
                      'Go to bag',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
