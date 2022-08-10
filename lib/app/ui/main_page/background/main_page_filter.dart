import 'dart:ui';

import 'package:flutter/material.dart';

class MainPageFilter extends StatelessWidget {
  const MainPageFilter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 56, sigmaY: 56),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
          child: SizedBox(
            width: size.width,
            height: size.height,
          )),
    );
  }
}
