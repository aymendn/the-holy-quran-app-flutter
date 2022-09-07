import 'package:flutter/material.dart';

import '../core/index.dart';

class DouaaScreen extends StatelessWidget {
  const DouaaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'دُعَاءُ خَتْمِ القُرْآن',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Text(
            AppConstant.douaaKhatmQuran,
            style: TextStyle(
              fontFamily: AppTheme.secondaryFontFamily,
              fontSize: 23,
              // height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
