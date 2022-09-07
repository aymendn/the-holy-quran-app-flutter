import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../quran/page_data.dart';
import '../providers/quran.dart';
import 'page_number.dart';
import 'quran_page.dart';
import 'simple_page_info.dart';

class PagesSlider extends StatelessWidget {
  const PagesSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    final quranListenFalse = Provider.of<Quran>(context, listen: false);
    final isLandscape = MediaQuery.of(context).size.aspectRatio > 0.5625;
    return CarouselSlider.builder(
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
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
        debugPrint('is keyboard open : $isKeyboardOpen');

        return isLandscape || isKeyboardOpen
            ? ListView(
                children: [
                  const SimplePageInfo(),
                  QuranPage(pageIndex: itemIndex + 1),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SimplePageInfo(),
                  QuranPage(pageIndex: itemIndex + 1),
                  const PageNumber(),
                ],
              );
      },
    );
  }
}
