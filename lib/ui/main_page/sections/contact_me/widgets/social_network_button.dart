import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/top_section/widgets/circle_icon.dart';

import '../../../../theme/app_constants.dart';

class SocialNetworkButton extends StatelessWidget {
  final String link;
  final String tag;
  final Icon icon;
  final Color backgroundColor;
  const SocialNetworkButton(
      {Key? key,
      required this.link,
      required this.tag,
      required this.icon,
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
          icon,
          SizedBox(
            width: 8,
          ),
          SelectableText(
            tag,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
