import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  const TabContent({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
