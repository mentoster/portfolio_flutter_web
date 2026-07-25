import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';
import 'animated_text_no_fade.dart';
import 'circle_icon.dart';

class LeftTextColumn extends StatelessWidget {
  const LeftTextColumn({
    Key? key,
    required this.controller,
  }) : super(key: key);

  static const _iconRadius = 36.0;
  final ScrollController controller;
  final animationTime = 2;

  void _animateToHeight(double size, {int duration = 2}) {
    if (!controller.hasClients) {
      return;
    }
    controller.animateTo(
      size.clamp(0.0, controller.position.maxScrollExtent),
      duration: Duration(seconds: duration),
      curve: Curves.fastOutSlowIn,
    );
  }

  Widget _socialLinks({double runSpacing = 0}) {
    return Wrap(
      spacing: 16,
      runSpacing: runSpacing,
      children: const [
        CircleIcon(
          name: 'vkontakte',
          link: 'https://vk.com/mentoster_official',
          iconPath: 'assets/icons/social_networks/vk.svg',
          radius: _iconRadius,
          backgroundColor: Color.fromARGB(255, 232, 238, 255),
        ),
        CircleIcon(
          name: 'whatsapp',
          link: 'https://wa.me/79162053580',
          iconPath: 'assets/icons/social_networks/whatsapp.svg',
          radius: _iconRadius,
          backgroundColor: Color.fromARGB(255, 232, 255, 232),
        ),
        CircleIcon(
          name: 'telegram',
          link: 'https://t.me/mentoster',
          iconPath: 'assets/icons/social_networks/telegram.svg',
          radius: _iconRadius,
          backgroundColor: Color.fromARGB(255, 232, 247, 255),
        ),
        CircleIcon(
          name: 'github',
          link: 'https://github.com/mentoster',
          iconPath: 'assets/icons/social_networks/github.svg',
          radius: _iconRadius,
          backgroundColor: Color.fromARGB(255, 233, 232, 232),
        ),
      ],
    );
  }

  Widget _buildCompact(BuildContext context, double width) {
    final titleSize = ResponsiveLayout.heroTitleSize(width);
    final subtitleSize = ResponsiveLayout.heroSubtitleSize(width);
    final bodySize = ResponsiveLayout.heroBodySize(width);

    return Column(
      key: const Key('compact-home-hero-text'),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Привет! Я',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: titleSize,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 6),
        AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,
          pause: const Duration(milliseconds: 400),
          animatedTexts: [
            ColorizeAnimatedTextNoFade(
              'Макаров Дмитрий',
              speed: const Duration(milliseconds: 400),
              textStyle: TextStyle(
                fontSize: titleSize,
                height: 1.05,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              colors: [
                Theme.of(context).colorScheme.primary,
                const Color.fromARGB(255, 0, 183, 255),
                Theme.of(context).colorScheme.primary,
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SelectableText(
          'Профессиональный Unity разработчик.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: subtitleSize,
          ),
        ),
        const SizedBox(height: 16),
        SelectableText(
          'Нанимая меня, вы получаете сертифицированного специалиста, который любит своё дело.',
          style: TextStyle(color: Colors.grey[700], fontSize: bodySize, height: 1.45),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 180, maxWidth: 320),
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (controller.hasClients) {
                  _animateToHeight(controller.position.maxScrollExtent, duration: 6);
                }
              },
              child: const Text(
                'Нанять меня',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _socialLinks(runSpacing: 12),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.35),
      child: Wrap(
        direction: Axis.vertical,
        spacing: defaultPadding,
        children: [
          PlayAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.ease,
            fps: 300,
            duration: Duration(seconds: animationTime),
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding * 4 - value * defaultPadding * 4,
                ),
                child: Opacity(
                  opacity: value,
                  child: Text(
                    'Привет! Я',
                    style: TextStyle(
                      fontWeight: heading1.fontWeight,
                      fontSize: heading1.fontSize! * 1.5,
                    ),
                  ),
                ),
              );
            },
          ),
          PlayAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.ease,
            fps: 300,
            duration: Duration(seconds: animationTime),
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding * 4 - value * defaultPadding * 4,
                ),
                child: Opacity(
                  opacity: value,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    isRepeatingAnimation: true,
                    pause: const Duration(milliseconds: 400),
                    animatedTexts: [
                      ColorizeAnimatedTextNoFade(
                        'Макаров Дмитрий',
                        speed: const Duration(milliseconds: 400),
                        textStyle: TextStyle(
                          fontSize: heading1.fontSize! * 1.5,
                          fontWeight: heading1.fontWeight,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          const Color.fromARGB(255, 0, 183, 255),
                          Theme.of(context).colorScheme.primary,
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          PlayAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.ease,
            fps: 300,
            delay: Duration(milliseconds: (animationTime * 0.2 * 1000).round()),
            duration: Duration(seconds: animationTime),
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding * 4 - value * defaultPadding * 4,
                ),
                child: Opacity(
                  opacity: value,
                  child: const SelectableText(
                    'Профессиональный Unity разработчик.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                ),
              );
            },
          ),
          PlayAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.ease,
            fps: 300,
            delay: Duration(milliseconds: (animationTime * 0.4 * 1000).round()),
            duration: Duration(seconds: animationTime),
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding * 4 - value * defaultPadding * 4,
                ),
                child: Opacity(
                  opacity: value,
                  child: SelectableText(
                    'Нанимая меня, вы\nполучаете сертифицированного специалиста,\nкоторый любит своё дело. ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: usualText.fontSize! * 1.5,
                    ),
                  ),
                ),
              );
            },
          ),
          PlayAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.ease,
            fps: 300,
            delay: Duration(milliseconds: (animationTime * 0.6 * 1000).round()),
            duration: Duration(seconds: animationTime),
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding * 4 - value * defaultPadding * 4,
                ),
                child: Opacity(
                  opacity: value,
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () {
                        if (controller.hasClients) {
                          _animateToHeight(
                            controller.position.maxScrollExtent,
                            duration: 6,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2,
                          vertical: defaultPadding,
                        ),
                        child: Text(
                          'Нанять меня',
                          style: TextStyle(
                            fontSize: appBar.fontSize! * 1.5,
                            color: Colors.white,
                            fontWeight: appBar.fontWeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          PlayAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.ease,
            fps: 300,
            delay: Duration(milliseconds: (animationTime * 0.8 * 1000).round()),
            duration: Duration(seconds: animationTime),
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding * 4 - value * defaultPadding * 4,
                ),
                child: Opacity(opacity: value, child: _socialLinks()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (ResponsiveLayout.isCompact(size.width)) {
      return _buildCompact(context, size.width);
    }
    return _buildDesktop(context, size);
  }
}
