import 'package:flutter/material.dart';

import '../global_widgets/appbar.dart';
import 'sections/projects_list/projects_list.dart';
import 'sections/top_section/top_section_projects.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final ScrollController _controller = ScrollController();
  final List<Widget> _sections = const [
    TopSectionProjects(),
    ProjectsList(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(needBack: true, controller: _controller),
      extendBodyBehindAppBar: true,
      body: ListView.builder(
        controller: _controller,
        itemCount: _sections.length,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) => _sections[index],
      ),
    );
  }
}
