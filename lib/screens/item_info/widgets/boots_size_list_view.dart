import 'package:flutter/material.dart';

class BootsSizeListView extends StatefulWidget {
  const BootsSizeListView({Key? key}) : super(key: key);

  @override
  State<BootsSizeListView> createState() => _BootsSizeListViewState();
}

class _BootsSizeListViewState extends State<BootsSizeListView> {
  final bootsSize = [7.5, 8, 9.5, 11];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  } else if (selectedIndex == null || selectedIndex != null) {
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
