import 'package:flutter/material.dart';

import '../custom_container.dart';
import '../page_info.dart';
import '../page_side.dart';

class TopOverlay extends StatelessWidget {
  const TopOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      offsetY: -1,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          PageInfo(),
          PageSide(),
        ],
      ),
    );
  }
}
