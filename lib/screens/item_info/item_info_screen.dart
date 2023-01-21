import 'package:flutter/material.dart';
import 'package:kylashoes/screens/item_info/widgets/item_info_screen_app_bar.dart';
import 'package:kylashoes/screens/item_info/widgets/item_container.dart';
import 'package:kylashoes/screens/item_info/widgets/item_photo_horizontal_list.dart';

class ItemInfoScreen extends StatefulWidget {
  const ItemInfoScreen({super.key});

  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  final bootsSize = [7.5, 8, 9.5, 11];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: ItemInfoScreenAppBar(
          itemName: 'Nike',
        ),
      ),
      body: ListView(
        children:  [
          const ItemContainer(imageUrl: 'assets/images/sneaker_01.png'),
          const SizedBox(height: 30),
          const ItemPhotoHorizontalList(
            imageUrl: ['assets/images/sneaker_01.png'],
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Air-Max-270',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 9,
                              width: '\$150.00'.length * 15,
                            ),
                          ),
                          const Text(
                            '\$150.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'The Nike Air Max 270 amps up an icon with a huge Max Air unit for cushioning under every step. If features a stretchy inner sleeve for a snug, sock-like fit.',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black)),
                  ),
                  child: const Text(
                    'M O R E  D E T A I L S',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'UK',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'USA',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 12.0,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView.builder(
                      itemCount: bootsSize.length + 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            radius: 30.0,
                            borderRadius: BorderRadius.circular(10.0),
                            onTap: () {
                              if (selectedIndex == index) {
                                setState(() {
                                  selectedIndex = null;
                                });
                              } else if (selectedIndex == null ||
                                  selectedIndex != null) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey[400]!),
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              alignment: Alignment.center,
                              width: 90,
                              child: index == 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Try it',
                                          style: TextStyle(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        Icon(
                                          Icons.four_mp_outlined,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                        )
                                      ],
                                    )
                                  : Text(
                                      bootsSize[index - 1].toString(),
                                      style: TextStyle(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
