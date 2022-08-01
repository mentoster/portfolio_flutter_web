import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/project.dart';
import '../../theme/app_fonts.dart';

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectableText(
          "Описание",
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontWeight: heading1.fontWeight,
              color: Colors.white.withOpacity(0.87),
              fontSize: heading1.fontSize! * 1.5),
        ),
        const SizedBox(
          height: 56,
        ),
        SizedBox(
          width: 550,
          child: SelectableText(
            project.page.description,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontWeight: usualText.fontWeight,
                color: Colors.white.withOpacity(0.87),
                fontSize: usualText.fontSize),
          ),
        ),
        project.page.link != null
            ? SelectableText(
                "\nСсылка: ${project.page.link}",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.87),
                    fontSize: usualText.fontSize),
              )
            : const SizedBox.shrink(),
        SelectableText(
          "\nДата работы: ${DateFormat('dd.MM.yyyy').format(project.date)}",
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.87),
              fontSize: usualText.fontSize),
        ),
      ],
    );
  }
}
