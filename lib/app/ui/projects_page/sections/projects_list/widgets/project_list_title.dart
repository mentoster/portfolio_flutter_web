import 'package:flutter/material.dart';

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
        children: const [
          SizedBox(
            height: 32,
          ),
          SelectableText(
            "Проекты",
            style: heading1,
          ),
          SizedBox(
            height: 32,
          ),
          SearchWidget(),
          SizedBox(
            height: 32,
          ),
          SelectableText(
            "All Gamedev Unity Flutter UI/UX Design  ",
            style: heading2Bold,
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
