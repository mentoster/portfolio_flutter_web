import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

import '../../../../global_widgets/shimmer_image.dart';
import '../../../../theme/responsive.dart';

class ProjectsImage extends StatelessWidget {
  const ProjectsImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  Widget _buildCompact() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            key: const Key('compact-projects-artwork'),
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(28),
                child: ShimmerImage.asset(
                  'assets/images/achievement_projects.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 22),
                child: ShimmerImage.asset(
                  'assets/images/rocket.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop() {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: SizedBox(
        height: size.height - 64,
        width: 800,
        child: ParallaxStack(
          resetCurve: Curves.fastOutSlowIn,
          resetDuration: const Duration(milliseconds: 400),
          layers: [
            ParallaxLayer(
              xOffset: 20,
              dimensionalOffset: 0.003,
              yOffset: 20,
              yRotation: 0.1,
              xRotation: 0.1,
              zRotation: 0.1,
              child: Center(
                child: ShimmerImage.asset(
                  'assets/images/rocket.png',
                  fit: BoxFit.fitWidth,
                  height: size.height / 1.4,
                ),
              ),
            ),
            ParallaxLayer(
              xOffset: 60,
              yOffset: 60,
              yRotation: 0.2,
              xRotation: 0.2,
              zRotation: 0.2,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ShimmerImage.asset(
                    'assets/images/achievement_projects.png',
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isCompact(MediaQuery.sizeOf(context).width)) {
      return _buildCompact();
    }
    return _buildDesktop();
  }
}
