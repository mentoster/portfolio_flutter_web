import 'package:flutter/material.dart';

import '../../../global_widgets/responsive_content.dart';
import '../../../theme/app_constants.dart';
import '../../../theme/responsive.dart';
import 'widgets/description_text_widget.dart';
import 'widgets/mobile_timeline_widget.dart';
import 'widgets/timeline_widget.dart';
import 'widgets/work_exp_title_widger.dart';
import 'widgets/wortk_titles_widget.dart';
import 'widgets/years_widget.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mobile = ResponsiveLayout.isMobile(MediaQuery.sizeOf(context).width);
    return ColoredBox(
      key: const Key('work-experience-section'),
      color: Colors.orange.withOpacity(0.03),
      child: ResponsiveContent(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: compactSectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const WorkExpTitleWidget(),
              const SizedBox(height: 24),
              const DescriptionTextWidget(),
              const SizedBox(height: 32),
              if (mobile)
                const MobileTimelineWidget()
              else ...[
                const WorkTitlesWidget(),
                const SizedBox(height: 32),
                const TimelineWidget(),
                const SizedBox(height: 20),
                YearsWidget(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
