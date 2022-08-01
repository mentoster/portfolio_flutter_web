import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/ui/project_page/widgets/project_images.dart';

import '../../data/information_data/info_projects.dart';
import '../global_widgets/appbar.dart';
import 'widgets/project_description.dart';

class ProjectPage extends StatelessWidget {
  ProjectPage({Key? key}) : super(key: key);
  final project = projects.projects[0];

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        controller: _controller,
        isDarkTheme: true,
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(project.page.backgroundImagePath,
              fit: BoxFit.cover, height: size.height, width: size.width),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.black.withOpacity(0.60),
          ),
          SizedBox(
            width: 1200,
            height: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProjectImages(project: project, size: size),
                ProjectDescription(project: project),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
