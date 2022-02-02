import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import 'widgets/description_text_widget.dart';
import 'widgets/timeline_widget.dart';
import 'widgets/work_exp_title_widger.dart';
import 'widgets/wortk_titles_widget.dart';
import 'widgets/years_widget.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      width: 1116,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            WorkExpTitleWidget(),
            SizedBox(
              height: 32,
            ),
            DescriptionTextWidget(),
            SizedBox(
              height: 32,
            ),
            WorkTitlesWidget(),
            TimelineWidget(),
            SizedBox(
              height: 32,
            ),
            YearsWidget()
          ],
        ),
      ),
    );
  }
}
