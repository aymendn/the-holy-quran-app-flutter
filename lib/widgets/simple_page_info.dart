import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../providers/quran.dart';

class SimplePageInfo extends StatelessWidget {
  const SimplePageInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    final isLandscape = MediaQuery.of(context).size.aspectRatio > 0.55;
    final colorScheme = Theme.of(context).colorScheme;

    final textStyle = TextStyle(
      fontSize: 14,
      color: colorScheme.infoText,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isLandscape)
            Text('${AppConstant.page} ${quran.currentPage}', style: textStyle),
          Text('${AppConstant.juz} ${quran.juz}', style: textStyle),
          Text(quran.hizbText, style: textStyle),
          Text(quran.surahName, style: textStyle),
        ],
      ),
    );
  }
}
