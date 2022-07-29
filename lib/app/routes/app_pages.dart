import '../ui/main_page/main_page.dart';
import 'package:flutter/material.dart';

import '../ui/projects_page/projects_page.dart';

part './app_routes.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.INITIAL: (_) => MainPage(),
    Routes.PROJECTS: (_) => const ProjectsPage(),
  };
}
