import 'package:flutter/material.dart';

import '../../../global_widgets/responsive_content.dart';
import '../../../theme/app_constants.dart';
import '../../../theme/app_fonts.dart';
import '../../../theme/responsive.dart';
import 'widgets/diplomas_carusel.dart';

class DiplomasWidget extends StatelessWidget {
  const DiplomasWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(width);
    return ColoredBox(
      key: const Key('diplomas-section'),
      color: Colors.deepPurple.withOpacity(0.03),
      child: ResponsiveContent(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: compactSectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectableText(
                'Многократный победитель хакатонов.',
                style: responsiveHeading1(width),
              ),
              const SizedBox(height: defaultPadding),
              SelectableText(
                compact
                    ? 'Я активно принимаю участиве во многих хакатонах - соревнованиях, в которых командам нужно за короткое время разработать прототип продукта. Здесь вы можете посмотреть, в каких конкретно я учавствовал. Используйте стрелки для навигации.'
                    : 'Я активно принимаю участиве во многих хакатонах -\n соревнованиях, в которых командам нужно\nза короткое время разработать прототип продукта\nЗдесь вы можете посмотреть,\nв каких конкретно я учавствовал.\n\nИспользуйте стрелки для навигации.',
                style: responsiveBody(width),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultPadding),
              DiplomasCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
