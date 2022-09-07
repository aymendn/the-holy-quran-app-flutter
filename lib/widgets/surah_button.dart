import 'package:flutter/material.dart';

class SurahButton extends StatelessWidget {
  const SurahButton(
      {Key? key,
      required this.text,
      this.color = Colors.black54,
      required this.onPressed})
      : super(key: key);

  final String text;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: color, fontSize: 15);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: color),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
