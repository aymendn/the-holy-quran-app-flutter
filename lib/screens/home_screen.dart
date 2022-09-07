import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_quran_app/providers/show_overlay_provider.dart';
import 'package:my_quran_app/widgets/quran_page.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../quran/page_data.dart';
import '../providers/quran.dart';
import '../widgets/custom_toast.dart';
import '../widgets/info_overlay/info_overlay.dart';
import '../widgets/marker.dart';
import '../widgets/page_number.dart';
import '../widgets/simple_page_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
    final quranListenFalse = Provider.of<Quran>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final isLandscape = size.aspectRatio > 0.54;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final colorScheme = Theme.of(context).colorScheme;

    debugPrint('Hole rebuild');
    return SafeArea(
      child: GestureDetector(
        onTap: overlay.toggleisShowOverlay,
        child: Scaffold(
          backgroundColor:
              isLandscape && size.width > 500 ? colorScheme.scaffoldBg : null,
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: isLandscape && size.width > 500
                      ? BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(
                              color: colorScheme.infoText,
                              width: 2,
                            ),
                          ),
                          color: colorScheme.scaffold,
                        )
                      : null,
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: CarouselSlider.builder(
                    carouselController: quran.carouselController,
                    options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: double.infinity,
                        initialPage: quran.currentPage - 1,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        onPageChanged: (int newIndex, _) {
                          quranListenFalse.changePage(newIndex);
                        }),
                    itemCount: quranPages.length,
                    itemBuilder: (_, pageIndex, __) {
                      return isLandscape || isKeyboardOpen
                          ? ListView(
                              children: [
                                const SimplePageInfo(),
                                QuranPage(pageIndex: pageIndex),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SimplePageInfo(),
                                QuranPage(pageIndex: pageIndex),
                                const PageNumber(),
                              ],
                            );
                    },
                  ),
                ),
                const Marker(),
                if (!overlay.isShowOverlay) const CustomToast(),
                const InfoOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
