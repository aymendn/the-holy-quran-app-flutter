import 'package:flutter/material.dart';

class ToastProvider extends ChangeNotifier {
  int hizbQuarter = 0;

  void update(int newHizbQuarter) {
    if (hizbQuarter != newHizbQuarter) {
      showToast();
    }
    hizbQuarter = newHizbQuarter;
  }

  bool isShowToast = false;

  double get opacity => isShowToast ? 1 : 0;

  Future<void> showToast() async {
    isShowToast = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 1500));

    isShowToast = false;
    notifyListeners();
  }
}
