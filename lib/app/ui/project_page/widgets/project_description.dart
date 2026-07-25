import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/models/project.dart';
import '../../theme/app_fonts.dart';
import '../../theme/responsive.dart';

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(viewportWidth);
    final headingStyle = compact
        ? responsiveHeading1(viewportWidth).copyWith(
            color: Colors.white.withOpacity(0.87),
          )
        : TextStyle(
            fontWeight: heading1.fontWeight,
            color: Colors.white.withOpacity(0.87),
            fontSize: heading1.fontSize! * 1.5,
          );
    final bodyStyle = responsiveBody(viewportWidth).copyWith(
      color: Colors.white.withOpacity(0.87),
    );

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: compact ? double.infinity : 550),
      child: Column(
        key: Key(compact
            ? 'project-description-compact'
            : 'project-description-desktop'),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Описание',
            textAlign: compact ? TextAlign.start : TextAlign.justify,
            style: headingStyle,
          ),
          SizedBox(height: compact ? 24 : 56),
          SelectableText(
            project.page.description,
            textAlign: compact ? TextAlign.start : TextAlign.justify,
            style: bodyStyle,
          ),
          if (project.page.link != null) ...[
            const SizedBox(height: 16),
            SelectableText(
              'Ссылка: ${project.page.link}',
              textAlign: compact ? TextAlign.start : TextAlign.justify,
              style: bodyStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
          const SizedBox(height: 16),
          SelectableText(
            'Дата работы: ${DateFormat('dd.MM.yyyy').format(project.date)}',
            textAlign: compact ? TextAlign.start : TextAlign.justify,
            style: bodyStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
