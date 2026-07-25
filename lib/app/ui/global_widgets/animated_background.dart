import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({
    Key? key,
    this.size,
  }) : super(key: key);

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size?.width ?? double.infinity,
      height: size?.height ?? double.infinity,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0x300000FF),
              Color(0x22030003),
              Color(0x2EF700FF),
              Color(0x22030003),
              Color(0x26FFFF00),
            ],
            stops: [0.0, 0.24, 0.5, 0.76, 1.0],
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-0.72, -0.55),
              radius: 1.25,
              colors: [
                Color(0x2BF700FF),
                Color(0x160000FF),
                Colors.transparent,
              ],
              stops: [0.0, 0.48, 1.0],
            ),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.78, 0.65),
                radius: 1.1,
                colors: [
                  Color(0x24FFFF00),
                  Color(0x140000FF),
                  Colors.transparent,
                ],
                stops: [0.0, 0.52, 1.0],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
