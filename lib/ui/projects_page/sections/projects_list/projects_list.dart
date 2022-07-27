import 'package:flutter/material.dart';

import '../../../../data/information_data/info_projects.dart';
import '../../../global_widgets/projects_grid_widget.dart';
import 'widgets/project_list_title.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 300 +
          200 *
              (projects.projects.length.toDouble() +
                  projects.projects.length.toDouble() % 2),
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.blue.withOpacity(0.03),
        body: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ProjectListTitle(),
                SizedBox(
                    height: 200 *
                        (projects.projects.length.toDouble() +
                            projects.projects.length.toDouble() % 2),
                    child: ProjectsGridWidget(
                        projects: projects, count: projects.projects.length)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
