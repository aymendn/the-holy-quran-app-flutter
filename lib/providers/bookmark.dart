import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/index.dart';

class BookMarkProvider extends ChangeNotifier {
  final SharedPreferences prefs;

  late int currentPage;

  late int markPage;

  BookMarkProvider(this.prefs) {
    markPage = prefs.getInt('mark') ?? 1;
  }

  void update(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  bool get isMarkedPage => currentPage == markPage;

  String get markButtonText {
    return isMarkedPage ? AppConstant.saved : AppConstant.saveBookmark;
  }

  Color get markButtonColor {
    return isMarkedPage
        ? const Color.fromARGB(255, 28, 95, 63)
        : Colors.transparent;
  }

  void changeMark() {
    markPage = currentPage;
    notifyListeners();
    prefs.setInt('mark', currentPage);
  }
}
