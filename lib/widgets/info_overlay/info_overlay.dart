import 'package:flutter/material.dart';

import 'bottom_overlay.dart';
import 'landscape_overlay.dart';
import 'top_overlay.dart';

class InfoOverlay extends StatelessWidget {
  const InfoOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).size.width > 630;

    return Column(
      mainAxisAlignment:
          isLandscape ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
      children: isLandscape
          ? [
              const LandscapeOverlay(),
            ]
          : const [
              TopOverlay(),
              BottomOverlay(),
            ],
    );
  }
}
