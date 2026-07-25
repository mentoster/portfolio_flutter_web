import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/responsive.dart';

class ProjectsTitle extends StatelessWidget {
  const ProjectsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(width);
    final fontSize = ResponsiveLayout.heroTitleSize(width);

    return PlayAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.ease,
      fps: 300,
      duration: const Duration(seconds: 2),
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.only(
            left: defaultPadding * 4 - value * defaultPadding * 4,
          ),
          child: Opacity(
            opacity: value,
            child: SelectableText(
              compact
                  ? 'Узнайте о всех проектах, над которыми я работал'
                  : 'Узнайте о всех \nпроектах, над \nкоторыми я \nработал',
              key: Key(compact ? 'compact-projects-title' : 'desktop-projects-title'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                height: compact ? 1.08 : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
