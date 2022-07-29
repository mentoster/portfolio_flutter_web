import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_projects.dart';

import '../../../../global_widgets/search_widget.dart';
import '../../../../theme/app_fonts.dart';

class ProjectListTitle extends StatelessWidget {
  const ProjectListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const SelectableText(
            "Проекты",
            style: heading1,
          ),
          const SizedBox(
            height: 32,
          ),
          SearchWidget(texts: [for (var pr in projects.projects) pr.title]),
          const SizedBox(
            height: 32,
          ),
          const SelectableText(
            "All Gamedev Unity Flutter UI/UX Design  ",
            style: heading2Bold,
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
