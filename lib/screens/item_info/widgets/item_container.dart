import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          child: Container(
            width: 1000,
            height: 300,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(223, 162, 144, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1500),
                // bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Image.asset(
            imageUrl,
            height: 350,
          ),
        ),
      ],
    );

    //    Stack(
    //     alignment: AlignmentDirectional.center,
    //     children: [
    //       // Positioned(
    //       //   child: Container(
    //       //     height: 350,
    //       //     decoration: const BoxDecoration(
    //       //       color: Color.fromRGBO(223, 162, 144, 1),
    //       //       borderRadius: BorderRadius.only(
    //       //         bottomRight: Radius.circular(0),
    //       //         bottomLeft: Radius.circular(200),
    //       //       ),
    //       //     ),
    //       //   ),
    //       // ),

    //       Positioned(
    //         left: 50,
    //         bottom: 20,
    //         child: Container(
    //           // width: 1000,
    //           // height: MediaQuery.of(context).size.height / 2.2,
    //           decoration: BoxDecoration(
    //             color: Colors.red,
    //             borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(1500),
    //               bottomRight: Radius.circular(100),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
  }
}
