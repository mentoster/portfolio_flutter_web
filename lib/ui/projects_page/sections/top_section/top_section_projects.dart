import 'package:flutter/material.dart';

import '../../../global_widgets/animated_background.dart';
import '../../../theme/app_fonts.dart';
import 'widgets/projects_image.dart';
import 'widgets/projects_title.dart';

class TopSectionProjects extends StatelessWidget {
  const TopSectionProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(alignment: Alignment.center, children: [
      AnimatedBackground(size: size),
      SizedBox(
        width: 1600,
        height: size.height - 24,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: Stack(alignment: Alignment.center, children: [
            Align(
                alignment: Alignment.centerRight,
                child: ProjectsImage(size: size)),
            const Align(
                alignment: Alignment.centerLeft, child: ProjectsTitle()),
          ]),
        ),
      ),
    ]);
  }
}
