import 'package:flutter/material.dart';

class ShoeSizeListView extends StatefulWidget {
  const ShoeSizeListView({Key? key}) : super(key: key);

  @override
  State<ShoeSizeListView> createState() => _ShoeSizeListViewState();
}

class _ShoeSizeListViewState extends State<ShoeSizeListView> {
  final shoeSizes = [7.5, 8, 9.5, 11];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ListView.separated(
        itemCount: shoeSizes.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == shoeSizes.length ? 16 : 0,
              left: index == 0 ? 16 : 0,
            ),
            child: Material(
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
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: const Color.fromRGBO(231, 230, 230, 1),
                    ),
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
                              Icons.straighten_rounded,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            )
                          ],
                        )
                      : Text(
                          shoeSizes[index - 1].toString(),
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
