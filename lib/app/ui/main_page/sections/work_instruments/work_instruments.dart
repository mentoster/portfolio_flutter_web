import 'package:flutter/material.dart';

import '../../../global_widgets/responsive_content.dart';
import '../../../theme/app_constants.dart';
import '../../../theme/app_fonts.dart';
import 'widgets/small_icons_wrap_widget.dart';
import 'widgets/top_five_widget.dart';

class WorkInstruments extends StatelessWidget {
  const WorkInstruments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return ColoredBox(
      key: const Key('work-instruments-section'),
      color: Colors.green.withOpacity(0.03),
      child: ResponsiveContent(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: compactSectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                'Работал со стеком и клиентами',
                key: const Key('work-instruments-title'),
                style: responsiveHeading1(width),
              ),
              const SizedBox(height: 32),
              SelectableText('Мой топ 5', style: responsiveHeading2(width)),
              const SizedBox(height: 32),
              const TopFiveWidget(),
              const SizedBox(height: 32),
              SelectableText('Другие', style: responsiveHeading2(width)),
              const SizedBox(height: 32),
              const SmallIconsWrapWidget(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
