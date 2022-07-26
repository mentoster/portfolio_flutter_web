import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/top_section/widgets/circle_icon.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

class LeftTextColumn extends StatelessWidget {
  const LeftTextColumn({
    Key? key,
  }) : super(key: key);
  static const _iconRadius = 36.0;
  final animationTime = 2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64),
      child: Wrap(
        direction: Axis.vertical,
        spacing: defaultPadding,
        children: [
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 72,
              duration: Duration(seconds: animationTime),
              builder: (context, child, value) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding * 4 - value * defaultPadding * 4),
                  child: Opacity(
                    opacity: value,
                    child: RichText(
                      text: TextSpan(
                        text: "Привет! Я",
                        style: TextStyle(
                            fontWeight: heading1.fontWeight,
                            fontSize: heading1.fontSize! * 1.5),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nМакаров Дмитрий',
                            style: TextStyle(
                                fontSize: heading1.fontSize! * 1.5,
                                fontWeight: heading1.fontWeight,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 72,
              delay:
                  Duration(milliseconds: (animationTime * 0.2 * 1000).round()),
              duration: Duration(seconds: animationTime),
              builder: (context, child, value) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding * 4 - value * defaultPadding * 4),
                  child: Opacity(
                    opacity: value,
                    child: const SelectableText(
                      "UI/UX Дизайнер, Flutter и Unity разработчик.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                  ),
                );
              }),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 72,
              delay:
                  Duration(milliseconds: (animationTime * 0.4 * 1000).round()),
              duration: Duration(seconds: animationTime),
              builder: (context, child, value) {
                return Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding * 4 - value * defaultPadding * 4),
                    child: Opacity(
                        opacity: value,
                        child: SelectableText(
                          "Нанимая меня, вы\nполучаете сертифицированного специалиста,\nкоторый любит своё дело. ",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: usualText.fontSize! * 1.5),
                        )));
              }),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 72,
              delay:
                  Duration(milliseconds: (animationTime * 0.6 * 1000).round()),
              duration: Duration(seconds: animationTime),
              builder: (context, child, value) {
                return Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding * 4 - value * defaultPadding * 4),
                    child: Opacity(
                        opacity: value,
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ))),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 2,
                                    vertical: defaultPadding),
                                child: SelectableText(
                                  'Нанять меня',
                                  style: TextStyle(
                                      fontSize: appBar.fontSize! * 1.5,
                                      fontWeight: appBar.fontWeight),
                                ),
                              )),
                        )));
              }),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 72,
              delay:
                  Duration(milliseconds: (animationTime * 0.8 * 1000).round()),
              duration: Duration(seconds: animationTime),
              builder: (context, child, value) {
                return Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding * 4 - value * defaultPadding * 4),
                    child: Opacity(
                        opacity: value,
                        child: Wrap(
                          spacing: 16,
                          children: const [
                            CircleIcon(
                              name: "vkontakte",
                              iconPath: "assets/icons/social_networks/vk.svg",
                              radius: _iconRadius,
                              backgroundColor:
                                  Color.fromARGB(255, 232, 238, 255),
                            ),
                            CircleIcon(
                              name: "whatsapp",
                              iconPath:
                                  "assets/icons/social_networks/whatsapp.svg",
                              radius: _iconRadius,
                              backgroundColor:
                                  Color.fromARGB(255, 232, 255, 232),
                            ),
                            CircleIcon(
                              name: "telegram",
                              iconPath:
                                  "assets/icons/social_networks/telegram.svg",
                              radius: _iconRadius,
                              backgroundColor:
                                  Color.fromARGB(255, 232, 247, 255),
                            ),
                            CircleIcon(
                              name: "github",
                              iconPath:
                                  "assets/icons/social_networks/github.svg",
                              radius: _iconRadius,
                              backgroundColor:
                                  Color.fromARGB(255, 233, 232, 232),
                            ),
                          ],
                        )));
              })
        ],
      ),
    );
  }
}
