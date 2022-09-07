import 'package:flutter/material.dart';

class ShowOverlayProvider extends ChangeNotifier {
  bool isShowOverlay = false;

  void toggleisShowOverlay() {
    isShowOverlay = !isShowOverlay;
    notifyListeners();
  }
}
