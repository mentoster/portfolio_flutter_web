import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.iconPath,
    required this.name,
    required this.radius,
    this.backgroundColor = const Color(0xfffbfdff),
  }) : super(key: key);

  final String iconPath;
  final String name;
  final double radius;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [
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
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(4),
      child: SvgPicture.asset(iconPath, semanticsLabel: name),
    );
  }
}
