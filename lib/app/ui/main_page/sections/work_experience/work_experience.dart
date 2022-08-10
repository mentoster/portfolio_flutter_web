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
    var size = MediaQuery.of(context).size;

    return SizedBox(
      height: 782,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.orange.withOpacity(0.03),
        body: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
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
        ),
      ),
    );
  }
}
