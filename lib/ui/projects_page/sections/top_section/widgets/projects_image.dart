import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

class ProjectsImage extends StatelessWidget {
  const ProjectsImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: SizedBox(
        height: size.height - 64,
        width: 800,
        child: ParallaxStack(
          layers: [
            ParallaxLayer(
              xOffset: 20,
              dimensionalOffset: 0.003,
              yOffset: 20,
              yRotation: 0.1,
              xRotation: 0.1,
              zRotation: 0.1,
              child: Stack(fit: StackFit.expand, children: [
                SizedBox(
                  child: Image.asset("assets/images/rocket.png",
                      fit: BoxFit.fitWidth, height: size.height / 1.5),
                ),
              ]),
            ),
            ParallaxLayer(
              xOffset: 50,
              yOffset: 50,
              yRotation: 0.2,
              xRotation: 0.2,
              zRotation: 0.2,
              child: Stack(fit: StackFit.expand, children: [
                Image.asset("assets/images/achievement_projects.png",
                    fit: BoxFit.fitWidth),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
