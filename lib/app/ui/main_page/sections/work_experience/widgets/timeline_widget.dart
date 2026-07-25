import 'package:flutter/material.dart';

import '../../../../global_widgets/shimmer_image.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1100,
      child: ShimmerImage.asset(
        "assets/images/timeline.png",
      ),
    );
  }
}
