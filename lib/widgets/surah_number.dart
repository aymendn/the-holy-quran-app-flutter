import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/index.dart';

class SurahNumber extends StatelessWidget {
  const SurahNumber({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppAsset.surahNumber,
          color: Colors.blue,
          width: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            number.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 1,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: AppTheme.secondaryFontFamily,
              // colorScheme.surahNumber,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
