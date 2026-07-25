import 'package:flutter/material.dart';

import '../../../../data/enums/technology.dart';
import '../../../../data/information_data/info_projects.dart';
import '../../../../data/models/project.dart';
import '../../../global_widgets/projects_grid_widget.dart';
import '../../../global_widgets/responsive_content.dart';
import 'widgets/project_list_title.dart';

class ProjectsList extends StatefulWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  List<Project> _searchResult = List.from(projects);
  List<Project> _filterResult = List.from(projects);
  Technology? tech;

  void onSearchTextChanged(String text) {
    _searchResult.clear();
    if (text.isEmpty) {
      _searchResult = List.from(projects);
      _filterResult = List.from(_searchResult);
      onTagSearch(tech);
      return;
    }

    for (var pr in projects) {
      if (pr.title.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(pr);
      }
    }
    _filterResult = List.from(_searchResult);
    onTagSearch(tech);
  }

  void onTagSearch(Technology? technology) {
    tech = technology;
    if (technology == null) {
      _filterResult = List.from(_searchResult);
      setState(() {});
      return;
    }

    _filterResult = [
      for (var pr in _searchResult)
        if (pr.technologies.contains(technology)) pr,
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.blue.withOpacity(0.03),
      child: ResponsiveContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectListTitle(
              onSearch: onSearchTextChanged,
              onTagSearch: onTagSearch,
            ),
            ProjectsGridWidget(
              projects: _filterResult,
              count: _filterResult.length,
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
