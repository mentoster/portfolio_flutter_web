import 'package:flutter/material.dart';

import '../../../../global_widgets/shimmer_image.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key? key}) : super(key: key);

  static const double _aspectRatio = 1184 / 230;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      key: const Key('work-timeline-desktop'),
      aspectRatio: _aspectRatio,
      child: ShimmerImage.asset(
        'assets/images/timeline.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
