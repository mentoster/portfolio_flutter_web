import 'package:flutter/material.dart';

import '../../../../data/information_data/info_projects.dart';
import '../../../global_widgets/projects_grid_widget.dart';
import '../../../global_widgets/responsive_content.dart';
import '../../../theme/app_constants.dart';
import 'widgets/about_me_widget.dart';
import 'widgets/projects_title_widget.dart';

class MeAndProjects extends StatelessWidget {
  const MeAndProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.lightBlue.withOpacity(0.03),
      child: ResponsiveContent(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: compactSectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AboutMeWidget(),
              const SizedBox(height: 48),
              const ProjectsTitleWidget(),
              const SizedBox(height: 32),
              ProjectsGridWidget(projects: projects, count: 4),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
