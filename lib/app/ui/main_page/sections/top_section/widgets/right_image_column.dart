import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

import '../../../../theme/responsive.dart';

class RightImageColumn extends StatelessWidget {
  const RightImageColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final alignment = Alignment.bottomCenter;

  Widget _buildCompact() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRect(
            child: Stack(
              key: const Key('compact-home-hero-artwork'),
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: SvgPicture.asset(
                      'assets/icons/abstract_figures/blobsbehind.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  right: 50,
                  bottom: 30,
                  child: Image.asset(
                    'assets/icons/abstract_figures/dog_and_stars.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  left: 70,
                  right: 70,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/me_photo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  right: 18,
                  top: 48,
                  width: 128,
                  child: Image.asset(
                    'assets/images/achievement.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop(Size currentSize) {
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: SizedBox(
        height: currentSize.height - 64,
        width: currentSize.width / 2,
        child: ParallaxStack(
          resetCurve: Curves.fastOutSlowIn,
          resetDuration: const Duration(milliseconds: 400),
          layers: [
            ParallaxLayer(
              xOffset: 25,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(
                  top: currentSize.height * 0.5,
                  right: currentSize.height * 0.25,
                ),
                child: Transform.scale(
                  scale: 1.3,
                  alignment: alignment,
                  child: SvgPicture.asset(
                    'assets/icons/abstract_figures/blobsbehind.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            ParallaxLayer(
              xOffset: 20,
              yOffset: 20,
              yRotation: 0.2,
              xRotation: 0.2,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(bottom: currentSize.height * 0.20),
                child: Transform.scale(
                  scale: 1,
                  alignment: alignment,
                  child: Image.asset(
                    'assets/icons/abstract_figures/dog_and_stars.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            ParallaxLayer(
              xOffset: 40,
              child: SizedBox(
                height: double.infinity,
                child: Transform.scale(
                  scale: 1,
                  alignment: alignment,
                  child: Image.asset(
                    'assets/images/me_photo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            ParallaxLayer(
              xOffset: 60,
              yOffset: 30,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(
                  right: currentSize.height * 0.2,
                  top: currentSize.height * 0.2,
                ),
                child: Transform.scale(
                  scale: 1,
                  alignment: alignment,
                  child: Image.asset(
                    'assets/images/achievement.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.sizeOf(context);
    if (ResponsiveLayout.isCompact(currentSize.width)) {
      return _buildCompact();
    }
    return _buildDesktop(currentSize);
  }
}
