import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../providers/quran.dart';

class PageNumber extends StatelessWidget {
  const PageNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    final colorScheme = Theme.of(context).colorScheme;

    final textStyle = TextStyle(
      fontSize: 14,
      color: colorScheme.infoText,
    );
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        '${AppConstant.page} ${quran.currentPage}',
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
