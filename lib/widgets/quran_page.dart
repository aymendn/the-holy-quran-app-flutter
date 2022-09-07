import 'package:flutter/material.dart';
import 'package:my_quran_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../quran/quran.dart';
import 'invert_color.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return InvertColor(
      isInvert: theme.isDarkMode,
      child: Image.asset(pageDir(pageIndex + 1)),
    );
  }
}
