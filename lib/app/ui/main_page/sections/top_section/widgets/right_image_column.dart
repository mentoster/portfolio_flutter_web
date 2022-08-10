import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

class RightImageColumn extends StatelessWidget {
  const RightImageColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final alignment = Alignment.bottomCenter;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 64,
      ),
      child: SizedBox(
        height: size.height - 64,
        width: size.width / 2,
        child: ParallaxStack(
          resetCurve: Curves.fastOutSlowIn,
          resetDuration: const Duration(milliseconds: 400),
          layers: [
            ParallaxLayer(
                xOffset: 25,
                child: Container(
                  height: double.infinity,
                  padding: EdgeInsets.only(
                      top: size.height * 0.5, right: size.height * 0.25),
                  child: Transform.scale(
                    scale: 1.3,
                    alignment: alignment,
                    child: SvgPicture.asset(
                      "assets/icons/abstract_figures/blobsbehind.svg",
                      fit: BoxFit.contain,
                    ),
                  ),
                )),
            ParallaxLayer(
              xOffset: 20,
              yOffset: 20,
              yRotation: 0.2,
              xRotation: 0.2,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(bottom: size.height * 0.20),
                child: Transform.scale(
                  scale: 1,
                  alignment: alignment,
                  child: Image.asset(
                      "assets/icons/abstract_figures/dog_and_stars.png",
                      fit: BoxFit.fitHeight),
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
                  child: Image.asset("assets/images/me_photo.png",
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
            ParallaxLayer(
              xOffset: 60,
              yOffset: 30,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.only(
                    right: size.height * 0.2, top: size.height * 0.2),
                child: Transform.scale(
                  scale: 1,
                  alignment: alignment,
                  child: Image.asset("assets/images/achievement.png",
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
