import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import 'widgets/hackathon_carusel.dart';

class Hackathons extends StatelessWidget {
  const Hackathons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1116,
      height: 970,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SelectableText(
              "Победитель и участников хакатонов.",
              style: heading1,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            const SelectableText(
              "Я активно принимаю участиве во многих хакатонах -\n соревнованиях, в которых командам нужно\nза короткое время разработать прототип продукта\nЗдесь вы можете посмотреть,\nв каких конкретно я учавствовал.\n\nИспользуйте стрелки для навигации.",
              style: usualText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            HackathonCarousel()
          ],
        ),
      ),
    );
  }
}
