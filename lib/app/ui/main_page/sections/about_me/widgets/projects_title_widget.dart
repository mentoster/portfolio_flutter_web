import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';

class ProjectsTitleWidget extends StatelessWidget {
  const ProjectsTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SelectableText("Последние работы", style: heading1),
        Link(
          uri: Uri.parse(Routes.PROJECTS),
          builder: (BuildContext context, FollowLink? followLink) => TextButton(
            onPressed: followLink,
            child: Row(
              children: [
                Text(
                  "Больше проектов",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: heading2.fontSize,
                      fontWeight: heading2.fontWeight),
                ),
                const SizedBox(
                  width: defaultPadding,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
