import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPrimary,
    required this.text,
    required this.onPressed,
    this.isFilled = false,
    this.primary,
    this.svgIcon,
    this.borderRadius = 5,
  }) : super(key: key);

  final bool isFilled;
  final Color? primary;
  final Color onPrimary;
  final String? svgIcon;
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: onPrimary,
      height: 1.5,
      fontSize: 15,
    );
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: primary,
          border: isFilled ? null : Border.all(width: 2, color: onPrimary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (svgIcon != null) ...[
              SvgPicture.asset(svgIcon!),
              const SizedBox(width: 5),
            ],
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
