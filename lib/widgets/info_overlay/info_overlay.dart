import 'package:flutter/material.dart';

import 'bottom_overlay.dart';
import 'landscape_overlay.dart';
import 'top_overlay.dart';

class InfoOverlay extends StatelessWidget {
  const InfoOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        (MediaQuery.of(context).orientation == Orientation.landscape);

    return Padding(
      padding: EdgeInsets.only(bottom: (isLandscape) ? 10 : 30),
      child: Column(
        mainAxisAlignment:
            // isLandscape ?
            MainAxisAlignment.end,

        //  : MainAxisAlignment.spaceBetween,
        children: isLandscape
            ? [
                const LandscapeOverlay(),
              ]
            : const [
                // TopOverlay(),
                BottomOverlay(),
              ],
      ),
    );
  }
}
