import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class BigCircleIcon extends StatelessWidget {
  const BigCircleIcon({Key? key, required this.title, required this.iconPath})
      : super(key: key);
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 164,
            height: 164,
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
                    width: 135,
                    height: 135,
                    child: SvgPicture.asset(iconPath, semanticsLabel: title)))),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: heading2,
        )
      ],
    );
  }
}
