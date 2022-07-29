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
        child: GridView.builder(
            itemCount: projects.projects.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.621848,
            ),
            padding: const EdgeInsets.only(
                left: defaultPadding * 2, right: defaultPadding * 2),
            itemBuilder: (context, i) {
              return ProjectCard(
                projectPreview: projects.projects[i].projectPreview,
                date: projects.projects[i].date,
                title: projects.projects[i].title,
                technology: projects.projects[i].technology,
              );
            }),
      ),
    );
  }
}
