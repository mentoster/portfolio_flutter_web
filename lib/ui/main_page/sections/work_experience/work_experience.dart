import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white.withOpacity(0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WorkExpTitleWidget(),
            const SizedBox(
              height: 32,
            ),
            const DescriptionTextWidget(),
            const SizedBox(
              height: 32,
            ),
            const WorkTitlesWidget(),
            const TimelineWidget(),
            const SizedBox(
              height: 32,
            ),
            YearsWidget()
          ],
        ),
      ),
    );
  }
}
