import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../providers/bookmark.dart';
import '../providers/quran.dart';
import '../providers/show_overlay_provider.dart';
import '../widgets/horizental_divider.dart';
import '../widgets/juz_card.dart';

class JuzIndexScreen extends StatelessWidget {
  const JuzIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookMark = Provider.of<BookMarkProvider>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
    final quran = Provider.of<Quran>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = TextStyle(
      color: colorScheme.juzCardText,
      fontSize: 15,
    );

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage);
      overlay.toggleisShowOverlay();
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstant.ajzaa),
        actions: [
          TextButton.icon(
            onPressed: _goToBookMark,
            icon: SvgPicture.asset(
              AppAsset.saveFilled,
              color: colorScheme.juzCardText,
            ),
            label: FittedBox(
              child: Text(
                AppConstant.goToBookMark,
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 30,
        separatorBuilder: (context, index) {
          return HorizentalDiv(color: colorScheme.div, thickness: 2);
        },
        itemBuilder: (BuildContext context, int index) {
          return JuzCard(juz: index + 1);
        },
      ),
    );
  }
}
