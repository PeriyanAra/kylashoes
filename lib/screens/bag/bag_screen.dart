import 'package:flutter/material.dart';
import 'package:kylashoes/common/widgets/custom_button.dart';
import 'package:kylashoes/screens/bag/widgets/bag_app_bar.dart';
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
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                height: 190,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'TOTAL',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$510.40',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width - 60,
                        onTap: () {},
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
