import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

class RightImageColumn extends StatelessWidget {
  const RightImageColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 64,
          ),
          SizedBox(
            height: size.height - 64,
            width: 800,
            child: ParallaxStack(
              touchBased: true,
              layers: [
                ParallaxLayer(
                  xOffset: 25,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          bottom: -250,
                          right: 0,
                          left: 0,
                          child: SvgPicture.asset(
                            "assets/icons/abstract_figures/blobsbehind.svg",
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ParallaxLayer(
                  xOffset: 30,
                  yOffset: 10,
                  yRotation: 0.2,
                  xRotation: 0.2,
                  child: Stack(fit: StackFit.expand, children: [
                    Positioned(
                      left: 0,
                      child: Image.asset(
                          "assets/icons/abstract_figures/dog_and_stars.png",
                          fit: BoxFit.fitWidth),
                    ),
                  ]),
                ),
                ParallaxLayer(
                  xOffset: 40,
                  child: Image.asset("assets/images/me_photo.png",
                      fit: BoxFit.fitHeight),
                ),
                ParallaxLayer(
                  xOffset: 60,
                  yOffset: 30,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/images/achievement.png",
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
