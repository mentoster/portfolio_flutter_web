import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';

class ProjectsTitleWidget extends StatelessWidget {
  const ProjectsTitleWidget({Key? key}) : super(key: key);

  Widget _moreProjects(BuildContext context, double width) {
    return Link(
      uri: Uri.parse(Routes.PROJECTS),
      builder: (BuildContext context, FollowLink? followLink) => TextButton(
        onPressed: followLink,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Больше проектов',
              style: ResponsiveLayout.isCompact(width)
                  ? TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: ResponsiveLayout.isMobile(width) ? 14 : 22,
                      fontWeight: FontWeight.w600,
                    )
                  : responsiveHeading2(width).copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
            ),
            SizedBox(
              width: ResponsiveLayout.isMobile(width) ? 8 : defaultPadding,
            ),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).colorScheme.primary,
              size: ResponsiveLayout.isMobile(width) ? 20 : 40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final title = SelectableText(
      'Последние работы',
      style: responsiveHeading1(width),
    );
    final more = _moreProjects(context, width);

    if (ResponsiveLayout.isCompact(width)) {
      return Column(
        key: const Key('projects-title-mobile'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, const SizedBox(height: 12), more],
      );
    }

    return Row(
      key: const Key('projects-title-row'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Flexible(child: title), more],
    );
  }
}
