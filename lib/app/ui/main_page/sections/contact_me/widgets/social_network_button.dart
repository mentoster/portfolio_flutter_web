import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor.withOpacity(0.1),
        onPrimary: Colors.white,
        elevation: 0,
        shadowColor: Colors.white.withOpacity(0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        minimumSize: const Size(277, 82), //////// HERE
      ),
      onPressed: () {
        launchUrl(Uri.parse(link));
      },
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
          Text(
            tag,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          )
        ],
      ),
    );
  }
}
