import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quran_app/providers/bookmark.dart';
import 'package:my_quran_app/widgets/horizental_divider.dart';
import 'package:my_quran_app/widgets/marker.dart';
import 'package:provider/provider.dart';
import '../providers/show_overlay_provider.dart';
import '../quran/quran.dart';

import '../core/index.dart';
import '../providers/quran.dart';

import '../widgets/surah_number.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context, listen: false);
    final bookMark = Provider.of<BookMarkProvider>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
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
        title: const Text(AppConstant.surahIndex),
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
        itemCount: 114,
        separatorBuilder: (context, index) {
          return HorizentalDiv(color: colorScheme.div);
        },
        itemBuilder: (BuildContext context, int index) {
          final surahNumber = index + 1;
          final page = getSurahFirstPage(surahNumber);
          return Stack(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  quran.goToPage(page - 1);
                },
                visualDensity: const VisualDensity(horizontal: -3),
                leading: SurahNumber(number: surahNumber),
                title: Text(
                  getSurahNameArabic(surahNumber),
                  style: const TextStyle(
                    fontFamily: AppTheme.secondaryFontFamily,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                subtitle: Text(
                  getSurahData(surahNumber),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  '$page',
                  style: TextStyle(
                    fontSize: 21,
                    color: colorScheme.pageNumber,
                  ),
                ),
              ),
              if (isMarkedSurah(bookMark.markPage, surahNumber))
                const Marker(left: 60),
            ],
          );
        },
      ),
    );
  }
}
