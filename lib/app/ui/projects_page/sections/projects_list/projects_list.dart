import 'package:flutter/material.dart';

import '../../../../data/enums/technology.dart';
import '../../../../data/information_data/info_projects.dart';
import '../../../../data/models/project.dart';
import '../../../global_widgets/projects_grid_widget.dart';
import 'widgets/project_list_title.dart';

class ProjectsList extends StatefulWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  List<Project> _searchResult = List.from(projects.projects);
  List<Project> _filterResult = List.from(projects.projects);
  Technology? tech;
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      _searchResult = List.from(projects.projects);
      _filterResult = List.from(_searchResult);
      onTagSearch(tech);
      return;
    }

    for (var pr in projects.projects) {
      if (pr.title.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(pr);
      }
    }
    _filterResult = List.from(_searchResult);
    onTagSearch(tech);
  }

  onTagSearch(Technology? technology) {
    tech = technology;
    if (technology == null) {
      setState(() {});
      return;
    }
    _filterResult.clear();
    for (var pr in _searchResult) {
      for (var t in pr.technologies) {
        if (t == technology) {
          _filterResult.add(pr);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 500 +
          200 *
              (_filterResult.length.toDouble() +
                  _filterResult.length.toDouble() % 2),
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
                ProjectListTitle(
                    onSearch: onSearchTextChanged, onTagSearch: onTagSearch),
                SizedBox(
                    height: 200 *
                        (_filterResult.length.toDouble() +
                            _filterResult.length.toDouble() % 2),
                    child: ProjectsGridWidget(
                        projects: _filterResult, count: _filterResult.length)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
