import 'package:flutter/material.dart';
import 'package:my_quran_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../quran/quran.dart';
import 'invert_color.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        (MediaQuery.of(context).orientation == Orientation.landscape);
    final theme = Provider.of<ThemeProvider>(context);
    return InvertColor(
      isInvert: theme.isDarkMode,
      child: SvgPicture.asset(
        pageDir(pageIndex + 1),
        width: MediaQuery.of(context).size.width * (isLandScape ? .85 : .95),
        // fit: BoxFit.contain,
      ),
    );
  }
}
