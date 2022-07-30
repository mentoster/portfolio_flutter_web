import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../theme/app_constants.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
    required this.texts,
    required this.onChanged,
  }) : super(key: key);
  final List<String> texts;
  final Function onChanged;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isTyping = false;

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
      ),
      child: Stack(fit: StackFit.expand, children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: TextFormField(
              keyboardType: TextInputType.text,
              autocorrect: true,
              maxLines: 1,
              onTap: () => setState(() => isTyping = true),
              onChanged: (input) {
                if (input.isEmpty) {
                  setState(() => isTyping = false);
                } else {
                  widget.onChanged(input);
                  setState(() => isTyping = true);
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 64),
                  fillColor: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(
                width: defaultPadding,
              ),
              !isTyping
                  ? AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      pause: const Duration(seconds: 3),
                      animatedTexts: [
                        for (var t in widget.texts)
                          TypewriterAnimatedText(
                            t,
                            speed: const Duration(milliseconds: 200),
                            textStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ]),
    );
  }
}
