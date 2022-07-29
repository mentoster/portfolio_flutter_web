import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../theme/app_constants.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key, required this.texts,
  }) : super(key: key);
  final List<String> texts;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 24,
            offset: Offset(0, 16),
          ),
          BoxShadow(
            color: Color(0x0a000000),
            blurRadius: 32,
            offset: Offset(0, 24),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(
                  width: defaultPadding,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  isRepeatingAnimation: true,
                  pause: const Duration(seconds: 3),
                  animatedTexts: [
                    for (var t in texts)
                      TypewriterAnimatedText(
                        t,
                        speed: const Duration(milliseconds: 200),
                        textStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
