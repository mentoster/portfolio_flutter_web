import 'package:flutter/material.dart';

import 'widgets/about_me_widget.dart';
import 'widgets/last_projects_grid_widget.dart';
import 'widgets/projects_title_widget.dart';

class MeAndProjects extends StatelessWidget {
  const MeAndProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 1100,
        width: 1116,
        child: Scaffold(
            body: Column(
          children: const [
            AboutMeWidget(),
            SizedBox(
              height: 32,
            ),
            ProjectsTitleWidget(),
            SizedBox(
              height: 32,
            ),
            LastProjectsGridWidget(),
          ],
        )));
  }
}
