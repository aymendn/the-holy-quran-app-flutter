import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoText extends StatelessWidget {
  const InfoText(
      {Key? key,
      required this.text,
      this.svgIcon,
      this.color = Colors.white,
      this.padding = 5})
      : super(key: key);

  final String? svgIcon;
  final String text;
  final Color color;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: Row(
        children: [
          if (svgIcon != null) ...[
            SvgPicture.asset(svgIcon!, color: color),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style:
                TextStyle(color: color, fontSize: text.length > 10 ? 14 : 16),
          ),
        ],
      ),
    );
  }
}
