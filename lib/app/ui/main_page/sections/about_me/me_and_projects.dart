import 'package:flutter/material.dart';

import '../../../../data/information_data/info_projects.dart';
import '../../../theme/app_constants.dart';
import 'widgets/about_me_widget.dart';
import '../../../global_widgets/projects_grid_widget.dart';
import 'widgets/projects_title_widget.dart';

class MeAndProjects extends StatelessWidget {
  const MeAndProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 1216,
      width: size.width,
      child: Scaffold(
          backgroundColor: Colors.lightBlue.withOpacity(0.03),
          body: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding * 2,
                  ),
                  const AboutMeWidget(),
                  const SizedBox(
                    height: 32,
                  ),
                  const SizedBox(width: 1116, child: ProjectsTitleWidget()),
                  const SizedBox(
                    height: 32,
                  ),
                  ProjectsGridWidget(
                    projects: projects.projects,
                    count: 4,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
