import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme/responsive.dart';

class SocialNetworkButton extends StatelessWidget {
  final String link;
  final String tag;
  final String iconPath;
  final String name;
  final Color backgroundColor;

  const SocialNetworkButton({
    Key? key,
    required this.link,
    required this.tag,
    required this.iconPath,
    required this.name,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor.withOpacity(0.1),
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.white.withOpacity(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          minimumSize: const Size(48, 64),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onPressed: () => launchUrl(Uri.parse(link)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: SvgPicture.asset(iconPath, semanticsLabel: name),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                tag,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ResponsiveLayout.isMobile(width) ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
