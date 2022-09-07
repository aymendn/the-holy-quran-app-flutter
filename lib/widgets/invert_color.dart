import 'package:flutter/material.dart';

class InvertColor extends StatelessWidget {
  const InvertColor({Key? key, required this.child, required this.isInvert})
      : super(key: key);

  final Widget child;
  final bool isInvert;

  @override
  Widget build(BuildContext context) {
    if (!isInvert) return child;
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix([
        -1, //RED
        0,
        0,
        0,
        255, //GREEN
        0,
        -1,
        0,
        0,
        255, //BLUE
        0,
        0,
        -1,
        0,
        255, //ALPHA
        0,
        0,
        0,
        1,
        0,
      ]),
      child: child,
    );
  }
}
