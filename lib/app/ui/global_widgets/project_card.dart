import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../data/enums/technology.dart';
import '../../data/models/project.dart';
import '../../routes/app_pages.dart';
import '../theme/app_fonts.dart';
import '../theme/responsive.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.projectPreview,
    required this.title,
    required this.technologies,
    required this.date,
  }) : super(key: key);

  final ProjectPreview projectPreview;
  final String title;
  final List<Technology> technologies;
  final DateTime date;

  static const _decoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(24)),
    boxShadow: [
      BoxShadow(color: Color(0x0a000000), blurRadius: 1),
      BoxShadow(color: Color(0x0a000000), blurRadius: 8, offset: Offset(0, 4)),
      BoxShadow(color: Color(0x0a000000), blurRadius: 24, offset: Offset(0, 16)),
      BoxShadow(color: Color(0x0a000000), blurRadius: 32, offset: Offset(0, 24)),
    ],
    color: Colors.white,
  );

  Widget _detailsLink(BuildContext context) {
    return Link(
      uri: Uri.parse('${Routes.PROJECTS}/${title.toLowerCase()}'),
      builder: (BuildContext context, FollowLink? followLink) => TextButton(
        onPressed: followLink,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Подробнее',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textContent(BuildContext context, double width, {bool desktop = false}) {
    return Padding(
      padding: EdgeInsets.all(desktop ? 20 : 18),
      child: Column(
        mainAxisSize: desktop ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: desktop ? MainAxisAlignment.spaceAround : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            technologies.map((val) => val.toShortString()).join(' & '),
            style: const TextStyle(fontSize: 14),
          ),
          SizedBox(height: desktop ? 8 : 12),
          Text(
            title,
            style: desktop ? heading2 : responsiveHeading2(width),
            softWrap: true,
          ),
          SizedBox(height: desktop ? 8 : 10),
          _detailsLink(context),
        ],
      ),
    );
  }

  Widget _compact(BuildContext context, double width) {
    return Container(
      key: Key('project-card-compact-$title'),
      width: double.infinity,
      decoration: _decoration,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(projectPreview.previewImagePath, fit: BoxFit.cover),
          ),
          _textContent(context, width),
        ],
      ),
    );
  }

  Widget _desktop(BuildContext context, double width) {
    return Container(
      key: Key('project-card-desktop-$title'),
      decoration: _decoration,
      clipBehavior: Clip.antiAlias,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(projectPreview.previewImagePath, fit: BoxFit.cover),
          ),
          Expanded(child: _textContent(context, width, desktop: true)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewportWidth = MediaQuery.sizeOf(context).width;
        final cardWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : viewportWidth;
        return ResponsiveLayout.isCompact(viewportWidth)
            ? _compact(context, viewportWidth)
            : _desktop(context, cardWidth);
      },
    );
  }
}
