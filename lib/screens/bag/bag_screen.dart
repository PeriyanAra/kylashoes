import 'package:flutter/material.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_bottom_status_bar.dart';
import 'package:kylashoes/screens/bag/widgets/bag_shoes_component.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 30),
        child: BagAppBar(),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.bottom -
              (kToolbarHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: BagShoesComponent(),
                      ),
                    );
                  },
                ),
              ),
             const BagBottomStatusBar()
            ],
          ),
        ),
      ),
    );
  }
}
