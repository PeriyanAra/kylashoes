import 'package:flutter/material.dart';
import 'package:kylashoes/screens/home/widgets/home_app_bar.dart';
import 'package:kylashoes/screens/home/widgets/new_shoes.dart';
import 'package:kylashoes/screens/home/widgets/shoes_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0.1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                color: const Color.fromRGBO(236, 236, 244, 0),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                child: Column(
                  children: const [
                    ShoesTab(),
                    SizedBox(height: 10),
                    NewShoes(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
