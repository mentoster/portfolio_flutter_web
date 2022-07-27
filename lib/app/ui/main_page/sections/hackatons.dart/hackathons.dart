import 'package:flutter/material.dart';

import '../../../theme/app_constants.dart';
import '../../../theme/app_fonts.dart';
import 'widgets/hackathon_carusel.dart';

class Hackathons extends StatelessWidget {
  const Hackathons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 1002,
      child: Scaffold(
        backgroundColor: Colors.deepPurple.withOpacity(0.03),
        body: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: defaultPadding * 2,
                ),
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
        ),
      ),
    );
  }
}
