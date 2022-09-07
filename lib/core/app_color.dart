import 'package:flutter/material.dart';

// Main Colors (Primary and Secondary)
class AppColor {
  const AppColor._();

  static const primaryLight = Color(0xffF6F8BD);
  static const secondaryLight = Colors.orangeAccent;

  static const primaryDark = primaryLight;
  static const secondaryDark = secondaryLight;
}

// Further Color Cutomization
extension CustomColorScheme on ColorScheme {
  Color get scaffold => brightness == Brightness.light
      ? const Color(0xffFEFFDD)
      : const Color(0xFF272727);

  Color get scaffoldBg => brightness == Brightness.light
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color(0xFF1B1B1B);

  Color get infoText => brightness == Brightness.light
      ? const Color(0xff9EA05B)
      : const Color(0xFFF3F3F3);

  Color get appBar => brightness == Brightness.light
      ? const Color(0xffF0D883)
      : const Color(0xFF0E0E0E);

  Color get pageNumber => brightness == Brightness.light
      ? const Color(0x7B000000)
      : const Color(0x92FFFFFF);

  Color get div => brightness == Brightness.light
      ? const Color.fromARGB(47, 0, 0, 0)
      : const Color.fromARGB(55, 255, 255, 255);

  Color get juzCardText => brightness == Brightness.light
      ? const Color(0xFF353608)
      : const Color(0xFFECECEC);

  Color get surahNumber => brightness == Brightness.light
      ? const Color(0xFF94BEFD)
      : const Color(0xff2877EE);
}
