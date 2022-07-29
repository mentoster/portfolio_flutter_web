import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';

class ProjectsTitle extends StatelessWidget {
  const ProjectsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: Curves.ease,
        fps: 300,
        duration: const Duration(seconds: 2),
        builder: (context, child, value) {
          return Padding(
            padding: EdgeInsets.only(
                left: defaultPadding * 4 - value * defaultPadding * 4),
            child: Opacity(
              opacity: value,
              child: SelectableText(
                "Узнайте о всех \nпроектах, над \nкоторыми я \nработал",
                style: TextStyle(
                    fontWeight: heading1.fontWeight,
                    fontSize: heading1.fontSize! * 1.5),
              ),
            ),
          );
        });
  }
}
