import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../theme/app_fonts.dart';

enum _WorkIconKind { unity, work, flutter, figma, teacher, collaborate }

class _WorkTimelineEvent {
  const _WorkTimelineEvent({
    required this.year,
    required this.title,
    required this.description,
    required this.icon,
  });

  final String year;
  final String title;
  final String description;
  final _WorkIconKind icon;
}

class MobileTimelineWidget extends StatelessWidget {
  const MobileTimelineWidget({Key? key}) : super(key: key);

  Widget _buildIcon(BuildContext context, _WorkIconKind icon) {
    switch (icon) {
      case _WorkIconKind.unity:
        return SvgPicture.asset(
          'assets/icons/instruments/top_5/unity.svg',
          width: 28,
          height: 28,
        );
      case _WorkIconKind.flutter:
        return SvgPicture.asset(
          'assets/icons/instruments/top_5/flutter.svg',
          width: 28,
          height: 28,
        );
      case _WorkIconKind.figma:
        return SvgPicture.asset(
          'assets/icons/instruments/top_5/figma.svg',
          width: 28,
          height: 28,
        );
      case _WorkIconKind.work:
        return Icon(
          Icons.work_outline,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        );
      case _WorkIconKind.teacher:
        return Icon(
          Icons.school_outlined,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        );
      case _WorkIconKind.collaborate:
        return Icon(
          Icons.handshake_outlined,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final events = <_WorkTimelineEvent>[
      const _WorkTimelineEvent(
        year: '2019',
        title: 'Unity',
        description: 'Начал изучать разработку игр и экосистему Unity.',
        icon: _WorkIconKind.unity,
      ),
      const _WorkTimelineEvent(
        year: '2020',
        title: 'RTUITLab',
        description: 'Присоединился к команде как Unity-разработчик.',
        icon: _WorkIconKind.work,
      ),
      const _WorkTimelineEvent(
        year: '2020',
        title: 'Flutter',
        description: 'Создал первый Flutter-проект и начал развиваться в технологии.',
        icon: _WorkIconKind.flutter,
      ),
      const _WorkTimelineEvent(
        year: '2021',
        title: 'Design',
        description: 'Сфокусировался на развитии UI/UX-навыков.',
        icon: _WorkIconKind.figma,
      ),
      const _WorkTimelineEvent(
        year: '2021',
        title: 'Unity Teacher',
        description: 'Начал преподавать Unity в вузе.',
        icon: _WorkIconKind.teacher,
      ),
      _WorkTimelineEvent(
        year: DateTime.now().year.toString(),
        title: 'Сейчас',
        description: 'Открыт к сотрудничеству и обсуждению новых проектов.',
        icon: _WorkIconKind.collaborate,
      ),
    ];

    return Column(
      key: const Key('work-timeline-mobile'),
      children: [
        for (var index = 0; index < events.length; index++)
          IntrinsicHeight(
            key: Key('mobile-work-event-$index'),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 52,
                  child: Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.10),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 1.5,
                          ),
                        ),
                        child: _buildIcon(context, events[index].icon),
                      ),
                      if (index != events.length - 1)
                        Expanded(
                          child: Container(
                            width: 2,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.24),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 2,
                      bottom: index == events.length - 1 ? 0 : 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          events[index].year,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SelectableText(
                          events[index].title,
                          style: responsiveHeading2(width).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SelectableText(
                          events[index].description,
                          style: responsiveBody(width).copyWith(height: 1.4),
                        ),
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
