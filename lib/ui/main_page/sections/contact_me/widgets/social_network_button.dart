import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialNetworkButton extends StatelessWidget {
  final String link;
  final String tag;
  final String iconPath;
  final String name;
  final Color backgroundColor;
  const SocialNetworkButton(
      {Key? key,
      required this.link,
      required this.tag,
      required this.iconPath,
      required this.name,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 277,
      height: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: backgroundColor.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 32,
              height: 32,
              child: SvgPicture.asset(iconPath, semanticsLabel: name)),
          const SizedBox(
            width: 8,
          ),
          SelectableText(
            tag,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
