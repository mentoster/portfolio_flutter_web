import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import 'hack_tag_widget.dart';

class HackathonDiplomaWidget extends StatelessWidget {
  const HackathonDiplomaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          "http://upload.portal.edu-region.ru/resize_cache/8622/c3bed4c46e3bebf9034448fed65e7b8e/iblock/5cc/5ccc8098ce63d2bfecded7e32dce4525/00a987972769c140e53bf8f7607f3cb6.jpeg",
          fit: BoxFit.fill,
          width: 378,
          height: 530,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Цифровой прорыв, финал 2021",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Wrap(
          spacing: 16,
          children: const [
            HackTagWidget(),
            HackTagWidget(),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        const Text(
          "Участвовал игровым разработчиком.",
          style: usualText,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
