import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';

class BigCircleIcon extends StatelessWidget {
  const BigCircleIcon({Key? key, required this.title, required this.iconPath})
      : super(key: key);

  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final diameter = ResponsiveLayout.isMobile(viewportWidth)
        ? (viewportWidth < 360 ? 124.0 : 144.0)
        : ResponsiveLayout.isTablet(viewportWidth)
            ? 152.0
            : 164.0;
    final iconSize = diameter * 0.80;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: diameter,
          height: diameter,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x0a000000),
                blurRadius: 1,
                offset: Offset(0, 0),
              ),
              BoxShadow(
                color: Color(0x0f000000),
                blurRadius: 2,
                offset: Offset(0, 0),
              ),
              BoxShadow(
                color: Color(0x0a000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
            color: Color(0xffFBFDFF),
          ),
          child: CircleAvatar(
            backgroundColor: const Color(0xffFBFDFF),
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: SvgPicture.asset(iconPath, semanticsLabel: title),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SelectableText(
          title,
          style: responsiveHeading2(viewportWidth),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
