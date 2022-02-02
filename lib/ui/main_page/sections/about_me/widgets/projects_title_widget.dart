import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

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
        const Text("Последние работы", style: heading1),
        Row(
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
      ],
    );
  }
}
