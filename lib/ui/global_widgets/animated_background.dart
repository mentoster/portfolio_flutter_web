import 'package:flutter/material.dart';
import 'package:sa3_liquid/sa3_liquid.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          width: size.width,
          height: size.height,
          child: const PlasmaRenderer(
            type: PlasmaType.infinity,
            particles: 2,
            color: Color.fromARGB(49, 247, 0, 255),
            blur: 0.7,
            size: 0.7,
            speed: 2,
            offset: 0,
            blendMode: BlendMode.srcOver,
            particleType: ParticleType.atlas,
            variation1: 0.31,
            variation2: 0.3,
            variation3: 0.0,
            rotation: -0.7,
          )),
      SizedBox(
        width: size.width,
        height: size.height,
        child: const PlasmaRenderer(
          type: PlasmaType.infinity,
          particles: 2,
          color: Color.fromARGB(50, 0, 0, 255),
          blur: 0.7,
          size: 0.7,
          speed: 2,
          offset: 0,
          blendMode: BlendMode.srcOver,
          particleType: ParticleType.atlas,
          variation1: 0.31,
          variation2: 0.3,
          variation3: 0.0,
          rotation: 1.2,
        ),
      ),
      SizedBox(
        width: size.width,
        height: size.height,
        child: const PlasmaRenderer(
          type: PlasmaType.infinity,
          particles: 2,
          color: Color.fromARGB(50, 255, 255, 0),
          blur: 0.7,
          size: 0.7,
          speed: 2,
          offset: 0,
          blendMode: BlendMode.srcOver,
          particleType: ParticleType.atlas,
          variation1: 0.31,
          variation2: 0.3,
          variation3: 0.0,
          rotation: 0,
        ),
      ),
    ]);
  }
}
