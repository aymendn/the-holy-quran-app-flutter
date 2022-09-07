import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../providers/quran.dart';

class PageSide extends StatelessWidget {
  const PageSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);

    return Column(
      children: [
        SvgPicture.asset(
            quran.isRightPage ? AppAsset.pageRight : AppAsset.pageLeft),
        Text(
          quran.hizbText,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
