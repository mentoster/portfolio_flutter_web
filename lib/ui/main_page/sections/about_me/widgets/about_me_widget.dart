import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 64,
      children: [
        const SelectableText(
          "Обо\nмне",
          style: heading1,
        ),
        SizedBox(
          width: 300,
          child: SelectableText(
              "Я заинтересовался технологиями с самого детства. С ответственностью и интересом подхожу к каждому проекту. Быстро осваиваю новые направления и навыки. Часто работаю в интенсивном режиме и выходные дни (при необходимости).",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: usualText.fontSize,
                  fontWeight: usualText.fontWeight)),
        ),
        RichText(
          text: TextSpan(
            text: "3+",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 96,
                fontWeight: heading1.fontWeight),
            children: <TextSpan>[
              TextSpan(
                text: '\nГода опыта',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: heading2.fontSize,
                    fontWeight: heading2.fontWeight),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 300,
          child: SelectableText(
              "Мой опыт в именно профессиональной деятельности начинается в момент поступления в вуз. Меня заинтересовало направления программная инженерия и с тех пор я каждый день читаю техническую литературу о технологиях, которые мне интересны.",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: usualText.fontSize,
                  fontWeight: usualText.fontWeight)),
        ),
      ],
    );
  }
}
