import 'package:flutter/material.dart';

import '../../data/models/project.dart';
import '../theme/app_constants.dart';
import 'project_card.dart';

class ProjectsGridWidget extends StatelessWidget {
  const ProjectsGridWidget({
    Key? key,
    required this.projects,
    required this.count,
  }) : super(key: key);
  final Projects projects;
  final int count;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: SizedBox(
        height: 764,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          padding: const EdgeInsets.only(
              left: defaultPadding * 2, right: defaultPadding * 2),
          childAspectRatio: 1.621848,
          children: List.generate(count, (index) {
            return ProjectCard(
              projectPreview: projects.projects[0].projectPreview,
              date: projects.projects[0].date,
              title: projects.projects[0].title,
              technology: projects.projects[0].technology,
            );
          }),
        ),
      ),
    );
  }
}
