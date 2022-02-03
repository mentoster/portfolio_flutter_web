import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/top_section/widgets/circle_icon.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class LeftTextColumn extends StatelessWidget {
  const LeftTextColumn({
    Key? key,
  }) : super(key: key);
  static const _iconRadius = 32.0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 16,
      children: [
        RichText(
          text: TextSpan(
            text: "Привет! Я",
            style: heading1,
            children: <TextSpan>[
              TextSpan(
                text: '\nМакаров Дмитрий',
                style: TextStyle(
                    fontSize: heading1.fontSize,
                    fontWeight: heading1.fontWeight,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        const Text(
          "UI/UX Дизайнер, Flutter и Unity разработчик.",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Text(
          "Нанимая меня, вы\nполучаете сертифицированного специалиста,\nкоторый любит своё дело. ",
          style:
              TextStyle(color: Colors.grey[600], fontSize: usualText.fontSize),
        ),
        SizedBox(
          height: 40,
          width: 178,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
              onPressed: () {},
              child: const Text(
                'Нанять меня',
                style: appBar,
              )),
        ),
        Wrap(
          spacing: 16,
          children: const [
            CircleIcon(
              name: "vkontakte",
              iconPath: "assets/icons/social_networks/vk.svg",
              radius: _iconRadius,
            ),
            CircleIcon(
              name: "whatsapp",
              iconPath: "assets/icons/social_networks/whatsapp.svg",
              radius: _iconRadius,
            ),
            CircleIcon(
              name: "telegram",
              iconPath: "assets/icons/social_networks/telegram.svg",
              radius: _iconRadius,
            ),
            CircleIcon(
              name: "github",
              iconPath: "assets/icons/social_networks/github.svg",
              radius: _iconRadius,
            ),
          ],
        )
      ],
    );
  }
}
