import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';
import 'job_widget.dart';

class WorkTitlesWidget extends StatelessWidget {
  const WorkTitlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Wrap(
      spacing: 24,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        const JobWidget(
          title: 'Unity',
          subTitle: 'Очень заинтригован созданием игр. Принялся изучать unity.',
        ),
        const JobWidget(
          title: 'RTUITLab',
          subTitle: 'Принятие на работу Unity разработчиком по созданному тестовому проекту.',
        ),
        const JobWidget(
          title: 'Flutter',
          subTitle: 'Впервые создал проект на flutter. Заинтересован в технологии.',
        ),
        const JobWidget(
          title: 'Design',
          subTitle: 'Был заинтересован в развитие UI/UX навыков',
        ),
        const JobWidget(
          title: 'Unity Teacher',
          subTitle: 'Устроен в вузе преподавателем unity.',
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 140, maxWidth: 176),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText(
                'Сейчас',
                style: responsiveHeading2(width).copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RichText(
                  text: TextSpan(
                    style: responsiveBody(width).copyWith(color: Colors.black),
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
          ),
        ),
      ],
    );
  }
}
