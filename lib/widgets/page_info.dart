import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../providers/quran.dart';
import 'info_overlay/info_text.dart';

class PageInfo extends StatelessWidget {
  const PageInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            InfoText(
              text: '${AppConstant.page} ${quran.currentPage}',
              svgIcon: AppAsset.page,
            ),
            const SizedBox(width: 5),
            InfoText(
              text: '${AppConstant.juz} ${quran.juz}',
              svgIcon: AppAsset.part,
            ),
          ],
        ),
        const SizedBox(height: 5),
        InfoText(text: quran.surahData, svgIcon: AppAsset.book),
      ],
    );
  }
}
