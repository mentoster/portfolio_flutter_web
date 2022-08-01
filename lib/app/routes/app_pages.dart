import 'package:portfolio_flutter_web/app/data/information_data/info_projects.dart';

import '../ui/main_page/main_page.dart';
import 'package:flutter/material.dart';

import '../ui/project_page/project_page.dart';
import '../ui/projects_page/projects_page.dart';

part './app_routes.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.INITIAL: (_) => MainPage(),
    Routes.PROJECTS: (_) => const ProjectsPage(),
    for (final pr in projects.projects)
      Routes.PROJECTS + "/" + pr.title.toLowerCase(): (_) => ProjectPage(
            project: pr,
          ),
  };
}
