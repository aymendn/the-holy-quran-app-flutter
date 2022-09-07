import 'package:flutter/material.dart';

class VerticalDiv extends StatelessWidget {
  const VerticalDiv({Key? key, this.color = const Color(0xff575757)})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 1,
      color: color,
    );
  }
}
