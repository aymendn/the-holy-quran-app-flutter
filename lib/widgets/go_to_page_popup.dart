import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../quran/page_data.dart';
import '../providers/quran.dart';
import '../quran/quran.dart';
import 'custom_button.dart';
import 'info_overlay/info_text.dart';
import 'page_feild.dart';

class GoToPagePopup extends StatefulWidget {
  const GoToPagePopup({Key? key}) : super(key: key);

  @override
  State<GoToPagePopup> createState() => _GoToPagePopupState();
}

int currentPage = -1;
String textC = '';

class _GoToPagePopupState extends State<GoToPagePopup> {
  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context, listen: false);
    final mQ = MediaQuery.of(context);
    final isLandscape = mQ.size.aspectRatio > 0.55 &&
        mQ.size.height - mQ.viewInsets.bottom < 280;

    int typedPage(String page) {
      if (int.tryParse(page) != null &&
          int.parse(page) > 0 &&
          int.parse(page) <= 604) {
        return int.parse(page);
      }
      return -1;
    }

    void _goToPage(String page) {
      if (typedPage(page) != -1) {
        quran.goToPage(int.parse(page));
      }
      currentPage = -1;
      Navigator.of(context).pop();
    }

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(AppConstant.goToPage),
                  const SizedBox(width: 10),
                  Flexible(
                    child: PageFeild(
                      onChanged: (text) {
                        textC = text;
                        setState(() {
                          currentPage = typedPage(text);
                        });
                      },
                      onSubmitted: _goToPage,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              if (!isLandscape) ...[
                const Text('معلومات عن الصفحة:'),
                PageInfo(currentPage: currentPage),
                const SizedBox(height: 10),
              ],
              ActionButtons(_goToPage, textC: textC),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons(
    this.goToPage, {
    Key? key,
    required this.textC,
  }) : super(key: key);

  final String textC;
  final Function(String) goToPage;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.juzCardText;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          onPrimary: color,
          isFilled: true,
          text: AppConstant.cancel,
        ),
        const SizedBox(width: 10),
        CustomButton(
          onPressed: () => goToPage(textC),
          onPrimary: Colors.white,
          primary: Colors.black87,
          text: AppConstant.move,
        ),
      ],
    );
  }
}

class PageInfo extends StatelessWidget {
  const PageInfo({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.pageNumber;

    return currentPage == -1
        ? Text(
            'الرجاء إدخال رقم صفحة ما بين 1 و 604',
            style: TextStyle(color: color, fontSize: 15),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  InfoText(
                    text:
                        '${AppConstant.juz} ${quranPages[currentPage - 1].juz}',
                    svgIcon: AppAsset.part,
                    color: color,
                    padding: 0,
                  ),
                  const SizedBox(width: 20),
                  InfoText(
                    text: gethizbText(currentPage),
                    svgIcon: AppAsset.page,
                    color: color,
                    padding: 0,
                  ),
                ],
              ),
              InfoText(
                text: getSurahDataWithNameByPage(currentPage),
                svgIcon: AppAsset.book,
                color: color,
                padding: 0,
              ),
            ],
          );
  }
}
