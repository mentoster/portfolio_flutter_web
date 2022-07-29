import 'package:flutter/material.dart';

import '../global_widgets/appbar.dart';
import 'sections/projects_list/projects_list.dart';
import 'sections/top_section/top_section_projects.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();

    return Scaffold(
      appBar: AppBarWidget(
        needBack: true,
        controller: _controller,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: const [
            TopSectionProjects(),
            ProjectsList(),
          ],
        ),
      ),
    );
  }
}
