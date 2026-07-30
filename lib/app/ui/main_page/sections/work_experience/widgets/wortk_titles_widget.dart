import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';
import 'job_widget.dart';

class WorkTitlesWidget extends StatelessWidget {
  const WorkTitlesWidget({Key? key}) : super(key: key);

  Widget _currentWork(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectableText(
          'Сейчас',
          style:
              responsiveHeading2(width).copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: RichText(
            text: TextSpan(
              style: responsiveBody(width).copyWith(
                color: Colors.black,
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'Готов '),
                TextSpan(
                  text: 'сотрудничать',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' с вами и обсуждать '),
                TextSpan(
                  text: 'новые',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' проекты.'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final columns = ResponsiveLayout.isDesktop(viewportWidth)
            ? 6
            : ResponsiveLayout.isTablet(viewportWidth)
                ? 3
                : 2;
        const spacing = 24.0;
        final itemWidth =
            (availableWidth - (spacing * (columns - 1))) / columns;
        final items = <Widget>[
          const JobWidget(
            title: 'Unity',
            subTitle:
                'Очень заинтригован созданием игр. Принялся изучать Unity.',
          ),
          const JobWidget(
            title: 'RTUITLab',
            subTitle:
                'Принят на работу Unity-разработчиком по тестовому проекту.',
          ),
          const JobWidget(
            title: 'Flutter',
            subTitle:
                'Создал первый Flutter-проект и заинтересовался технологией.',
          ),
          const JobWidget(
            title: 'Design',
            subTitle: 'Начал развивать UI/UX-навыки.',
          ),
          const JobWidget(
            title: 'Unity Teacher',
            subTitle: 'Начал преподавать Unity в вузе.',
          ),
          _currentWork(context, viewportWidth),
        ];

        return Wrap(
          key: const Key('work-titles-grid'),
          spacing: spacing,
          runSpacing: 32,
          children: [
            for (final item in items)
              SizedBox(
                width: itemWidth,
                child: item,
              ),
          ],
        );
      },
    );
  }
}
