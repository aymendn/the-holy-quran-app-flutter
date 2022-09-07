import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/index.dart';
import '../providers/quran.dart';
import '../quran/quran.dart';
import 'horizental_divider.dart';
import 'vertical_divider.dart';

const vDiv = VerticalDiv(color: Color.fromARGB(104, 165, 165, 165));
const hDiv = HorizentalDiv(color: Color.fromARGB(104, 165, 165, 165));

class JuzCard extends StatelessWidget {
  const JuzCard({Key? key, required this.juz}) : super(key: key);

  final int juz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 95,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomText(
                  '${AppConstant.juz} $juz',
                  fontSize: 24,
                  page: getJuzPage(juz),
                  fontWeight: FontWeight.bold,
                ),
              ),
              vDiv,
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    hizbPart(1),
                    hDiv,
                    hizbPart(2),
                  ],
                ),
              ),
              vDiv,
              Expanded(
                  child: CustomText(
                '${getJuzPage(juz)}',
                page: getJuzPage(juz),
              ))
            ],
          ),
        ),
      ],
    );
  }

  Expanded hizbPart(int hizb) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomText(
              '${AppConstant.hizb} ${getHizb(juz: juz, hizb: hizb)}',
              page: getHizbPage(
                getHizb(juz: juz, hizb: hizb),
              ),
            ),
          ),
          vDiv,
          Expanded(
            flex: 2,
            child: CustomText(
              'ربع',
              page: getHizbQuarterPage(
                getHizbQuarter(hizb: getHizb(juz: juz, hizb: hizb), quarter: 1),
              ),
            ),
          ),
          vDiv,
          Expanded(
            flex: 2,
            child: CustomText(
              'نصف',
              page: getHizbQuarterPage(
                getHizbQuarter(hizb: getHizb(juz: juz, hizb: hizb), quarter: 2),
              ),
            ),
          ),
          vDiv,
          Expanded(
            flex: 2,
            child: CustomText(
              '3 أرباع',
              page: getHizbQuarterPage(
                getHizbQuarter(hizb: getHizb(juz: juz, hizb: hizb), quarter: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {Key? key, this.fontSize, required this.page, this.fontWeight})
      : super(key: key);

  final String text;
  final double? fontSize;
  final int page;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.infinite,
      ),
      onPressed: () {
        quran.goToPage(page);
        Navigator.pop(context);
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppTheme.secondaryFontFamily,
            fontSize: fontSize,
            color: colorScheme.juzCardText,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
