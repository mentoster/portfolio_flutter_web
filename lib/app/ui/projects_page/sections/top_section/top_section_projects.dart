import 'package:flutter/material.dart';

import '../../../global_widgets/animated_background.dart';
import '../../../global_widgets/responsive_content.dart';
import '../../../theme/responsive.dart';
import 'widgets/projects_image.dart';
import 'widgets/projects_title.dart';

class TopSectionProjects extends StatelessWidget {
  const TopSectionProjects({Key? key}) : super(key: key);

  Widget _buildDesktop(Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBackground(size: size),
        SizedBox(
          width: 1600,
          height: size.height - 24,
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: ProjectsImage(size: size),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: ProjectsTitle(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompact(Size size) {
    return Stack(
      children: [
        const Positioned.fill(child: AnimatedBackground()),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Padding(
            padding: const EdgeInsets.only(top: 110, bottom: 48),
            child: ResponsiveContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ProjectsTitle(),
                  const SizedBox(height: 24),
                  ProjectsImage(size: size),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (ResponsiveLayout.isCompact(size.width)) {
      return _buildCompact(size);
    }
    return _buildDesktop(size);
  }
}
