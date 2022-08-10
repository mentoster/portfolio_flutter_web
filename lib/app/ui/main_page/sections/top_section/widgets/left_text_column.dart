import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';
import 'animated_text_no_fade.dart';
import 'circle_icon.dart';

class LeftTextColumn extends StatelessWidget {
  const LeftTextColumn({
    Key? key,
  }) : super(key: key);
  static const _iconRadius = 36.0;
  final animationTime = 2;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.35),
      child: Wrap(
        direction: Axis.vertical,
        spacing: defaultPadding,
        children: [
          PlayAnimation<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.ease,
            fps: 300,
            duration: Duration(seconds: animationTime),
            builder: (context, child, value) {
              return Padding(
                padding: EdgeInsets.only(
                    left: defaultPadding * 4 - value * defaultPadding * 4),
                child: Opacity(
                  opacity: value,
                  child: Text(
                    "Привет! Я",
                    style: TextStyle(
                        fontWeight: heading1.fontWeight,
                        fontSize: heading1.fontSize! * 1.5),
                  ),
                ),
              );
            },
          ),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 300,
              duration: Duration(seconds: animationTime),
              builder: (context, child, value) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding * 4 - value * defaultPadding * 4),
                  child: Opacity(
                      opacity: value,
                      child: AnimatedTextKit(
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          pause: const Duration(milliseconds: 400),
                          animatedTexts: [
                            ColorizeAnimatedTextNoFade('Макаров Дмитрий',
                                speed: const Duration(milliseconds: 400),
                                textStyle: TextStyle(
                                    fontSize: heading1.fontSize! * 1.5,
                                    fontWeight: heading1.fontWeight,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  const Color.fromARGB(255, 0, 183, 255),
                                  Theme.of(context).colorScheme.primary,
                                ]),
                          ])),
                );
              }),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 300,
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
                      "Профессиональный Unity разработчик.",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                  ),
                );
              }),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 300,
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
              fps: 300,
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
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.primary),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 2,
                                    vertical: defaultPadding),
                                child: Text(
                                  'Нанять меня',
                                  style: TextStyle(
                                      fontSize: appBar.fontSize! * 1.5,
                                      color: Colors.white,
                                      fontWeight: appBar.fontWeight),
                                ),
                              )),
                        )));
              }),
          PlayAnimation<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.ease,
              fps: 300,
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
