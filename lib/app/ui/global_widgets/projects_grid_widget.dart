import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../data/models/project.dart';
import '../theme/responsive.dart';
import 'project_card.dart';

class ProjectsGridWidget extends StatelessWidget {
  const ProjectsGridWidget({
    Key? key,
    required this.projects,
    required this.count,
  }) : super(key: key);

  final List<Project> projects;
  final int count;

  int get _itemCount => math.min(count, projects.length);

  ProjectCard _card(int index) {
    final project = projects[index];
    return ProjectCard(
      projectPreview: project.preview,
      date: project.date,
      title: project.title,
      technologies: project.technologies,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;

        if (ResponsiveLayout.isCompact(width)) {
          return Column(
            key: const Key('projects-one-column'),
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < _itemCount; i++) ...[
                _card(i),
                if (i != _itemCount - 1) const SizedBox(height: 24),
              ],
            ],
          );
        }

        return GridView.builder(
          key: const Key('projects-two-column'),
          itemCount: _itemCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.621848,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          itemBuilder: (context, i) => _card(i),
        );
      },
    );
  }
}
