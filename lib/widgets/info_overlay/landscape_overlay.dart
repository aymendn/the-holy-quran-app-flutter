import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quran_app/providers/bookmark.dart';
import 'package:my_quran_app/providers/theme_provider.dart';
import 'package:my_quran_app/widgets/custom_container.dart';
import 'package:provider/provider.dart';

import '../../core/index.dart';
import '../../providers/quran.dart';
import '../../providers/show_overlay_provider.dart';
import '../go_to_page_popup.dart';
import '../horizental_divider.dart';
import '../vertical_divider.dart';
import 'info_text.dart';

class LandscapeOverlay extends StatelessWidget {
  const LandscapeOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    final theme = Provider.of<ThemeProvider>(context);
    final bookMark = Provider.of<BookMarkProvider>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);

    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
    );

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage);
      overlay.toggleisShowOverlay();
    }

    return CustomContainer(
      child: Column(
        children: [
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
              const SizedBox(width: 5),
              InfoText(
                text: quran.hizbText,
              ),
              const SizedBox(width: 5),
              InfoText(
                text: quran.surahData,
                svgIcon: AppAsset.book,
              ),
              const Spacer(),
              IconButton(
                icon: SvgPicture.asset(
                  bookMark.isMarkedPage ? AppAsset.saveFilled : AppAsset.save,
                ),
                onPressed: bookMark.changeMark,
              ),
              IconButton(
                icon: SvgPicture.asset(AppAsset.search),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              IconButton(
                icon: SvgPicture.asset(AppAsset.moon),
                onPressed: () => theme.toggleTheme(!theme.isDarkMode),
              ),
            ],
          ),
          const HorizentalDiv(),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextButton.icon(
                    onPressed: _goToBookMark,
                    icon: SvgPicture.asset(AppAsset.saveFilled),
                    label: const FittedBox(
                      child: Text(
                        AppConstant.goToBookMark,
                        style: textStyle,
                      ),
                    ),
                  ),
                ),
                const VerticalDiv(),
                Expanded(
                  flex: 3,
                  child: TextButton.icon(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => const GoToPagePopup(),
                      );
                      overlay.toggleisShowOverlay();
                    },
                    icon: SvgPicture.asset(AppAsset.page),
                    label: const Text(
                      AppConstant.changePage,
                      style: textStyle,
                    ),
                  ),
                ),
                const VerticalDiv(),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/index');
                    },
                    icon: SvgPicture.asset(AppAsset.index),
                    label: const Text(
                      AppConstant.index,
                      style: textStyle,
                    ),
                  ),
                ),
                const VerticalDiv(),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/juz-index');
                    },
                    icon: SvgPicture.asset(AppAsset.part),
                    label: const Text(
                      AppConstant.ajzaa,
                      style: textStyle,
                    ),
                  ),
                ),
                const VerticalDiv(),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/douaa');
                    },
                    icon: SvgPicture.asset(AppAsset.hand),
                    label: const FittedBox(
                      child: FittedBox(
                        child: Text(
                          AppConstant.douaa,
                          style: textStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
