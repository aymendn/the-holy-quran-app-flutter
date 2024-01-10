import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_quran_app/screens/index_screen.dart';
import 'package:my_quran_app/screens/juz_index_screen.dart';
import 'package:provider/provider.dart';

import '../../core/index.dart';
import '../../providers/bookmark.dart';
import '../../providers/quran.dart';
import '../../providers/show_overlay_provider.dart';
import '../../providers/theme_provider.dart';
import '../custom_button.dart';
import '../custom_container.dart';
import '../go_to_page_popup.dart';
import '../horizental_divider.dart';
import '../vertical_divider.dart';
import 'search_button.dart';

class BottomOverlay extends StatelessWidget {
  const BottomOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context, listen: false);
    final bookMark = Provider.of<BookMarkProvider>(context);
    final themeListenFalse = Provider.of<ThemeProvider>(context, listen: false);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage - 1);
      overlay.toggleisShowOverlay();
    }

    return CustomContainer(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: Row(
          //     children: [
          //       const Expanded(child: SearchButton()),
          //       const SizedBox(width: 10),
          //       CustomButton(
          //         onPressed: bookMark.changeMark,
          //         text: bookMark.markButtonText,
          //         onPrimary: const Color(0xffA9A9A8),
          //         primary: bookMark.markButtonColor,
          //         svgIcon: AppAsset.saveFilled,
          //       )
          //     ],
          //   ),
          // ),
          // const HorizentalDiv(),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => IndexScreen(),
                            fullscreenDialog: true),
                      );
                      // Navigator.of(context).pushNamed('/index');
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
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => JuzIndexScreen(),
                            fullscreenDialog: true),
                      );

                      // Navigator.of(context).pushNamed('/juz-index');
                    },
                    icon: SvgPicture.asset(AppAsset.part),
                    label: const Text(
                      AppConstant.ajzaa,
                      style: textStyle,
                    ),
                  ),
                ),
                // const VerticalDiv(),
                Expanded(
                  child: CustomButton(
                    onPressed: bookMark.changeMark,
                    text: bookMark.markButtonText,
                    onPrimary: const Color(0xffA9A9A8),
                    primary: bookMark.markButtonColor,
                    svgIcon: AppAsset.saveFilled,
                  ),
                  // TextButton.icon(
                  //   onPressed: () {
                  //     Navigator.of(context).pushNamed('/douaa');
                  //   },
                  //   icon: SvgPicture.asset(AppAsset.hand),
                  //   label: const FittedBox(
                  //     child: FittedBox(
                  //       child: Text(
                  //         AppConstant.douaa,
                  //         style: textStyle,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),

          const HorizentalDiv(),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
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
                  flex: 4,
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
                    label: const FittedBox(
                      child: Text(
                        AppConstant.changePage,
                        style: textStyle,
                      ),
                    ),
                  ),
                ),
                const VerticalDiv(),
                IconButton(
                  icon: SvgPicture.asset(
                    bookMark.isMarkedPage ? AppAsset.saveFilled : AppAsset.save,
                  ),
                  onPressed: bookMark.changeMark,
                ),
                const VerticalDiv(),
                IconButton(
                  icon: Consumer<ThemeProvider>(
                    builder: (context, theme, child) {
                      return SvgPicture.asset(
                          theme.isDarkMode ? AppAsset.sun : AppAsset.moon);
                    },
                  ),
                  onPressed: () {
                    themeListenFalse.toggleTheme(!themeListenFalse.isDarkMode);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const textStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
);
