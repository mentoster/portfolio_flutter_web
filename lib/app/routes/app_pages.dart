import 'package:portfolio_flutter_web/app/ui/main_page/main_page.dart';
import 'package:flutter/material.dart';

import '../ui/projects_page/projects_page.dart';

part './app_routes.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.INITIAL: (_) => const MainPage(),
    Routes.PROJECTS: (_) => const ProjectsPage(),
  };
}
