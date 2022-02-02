import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import 'job_widget.dart';

class WorkTitlesWidget extends StatelessWidget {
  const WorkTitlesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      children: [
        JobWidget(
          title: "Unity",
          subTitle: "Очень заинтригован созданием игр. Принялся изучать unity.",
        ),
        JobWidget(
          title: "RTUITLab",
          subTitle:
              "Принятие на работу Unity разработчиком по созданному тестовому проекту.",
        ),
        JobWidget(
          title: "Flutter",
          subTitle:
              "Впервые создал проект на flutter. Заинтересован в технологии.",
        ),
        JobWidget(
          title: "Design",
          subTitle: "Был заинтересован в развитие UI/UX навыков",
        ),
        JobWidget(
          title: "Design",
          subTitle: "Устроен в вузе преподавателем unity.",
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Сейчас",
              style: TextStyle(
                  fontSize: heading2.fontSize, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 176,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: RichText(
                text: TextSpan(
                  text: "Готов\n",
                  style: usualText,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'сотрудничать',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: usualText.fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' с\nвами и обсуждать ',
                      style: usualText,
                    ),
                    TextSpan(
                      text: 'новые',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: usualText.fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' проекты.',
                      style: usualText,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
