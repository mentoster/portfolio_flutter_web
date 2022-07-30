import 'package:flutter/material.dart';

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
  final List<Project> _searchResult = List.from(projects.projects);

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {
        _searchResult;
      });
      return;
    }

    for (var pr in projects.projects) {
      if (pr.title.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(pr);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 400 +
          200 *
              (_searchResult.length.toDouble() +
                  _searchResult.length.toDouble() % 2),
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
                ProjectListTitle(onSearch: onSearchTextChanged),
                SizedBox(
                    height: 200 *
                        (_searchResult.length.toDouble() +
                            _searchResult.length.toDouble() % 2),
                    child: ProjectsGridWidget(
                        projects: _searchResult, count: _searchResult.length)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
