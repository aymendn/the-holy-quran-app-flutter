import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quran_app/providers/bookmark.dart';
import 'package:provider/provider.dart';
import '../core/index.dart';

class Marker extends StatelessWidget {
  const Marker({Key? key, this.left = 90}) : super(key: key);

  final double left;

  @override
  Widget build(BuildContext context) {
    final bookMark = Provider.of<BookMarkProvider>(context);

    if (bookMark.isMarkedPage) {
      return Positioned(
        left: left,
        top: 0,
        child: SvgPicture.asset(AppAsset.mark),
      );
    }
    return const SizedBox.shrink();
  }
}
