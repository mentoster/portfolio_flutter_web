import 'package:flutter/material.dart';

import '../../../theme/app_constants.dart';
import 'widgets/about_me_widget.dart';
import 'widgets/last_projects_grid_widget.dart';
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
                children: const [
                  SizedBox(
                    height: defaultPadding * 2,
                  ),
                  AboutMeWidget(),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(width: 1116, child: ProjectsTitleWidget()),
                  SizedBox(
                    height: 32,
                  ),
                  LastProjectsGridWidget(),
                  SizedBox(
                    height: defaultPadding,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
