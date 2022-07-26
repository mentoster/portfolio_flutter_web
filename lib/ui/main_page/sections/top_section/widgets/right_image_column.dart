import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import '../../../../global_widgets/drag_play.dart';

class RightImageColumn extends StatelessWidget {
  const RightImageColumn({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 64,
        ),
        Container(
          padding: const EdgeInsets.only(left: 128),
          width: size.width / 2,
          height: size.height - 64,
          child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                  height: size.height - 172,
                  bottom: -size.height / 4,
                  child: SvgPicture.asset(
                    "assets/icons/abstract_figures/photo_background_blob2.svg",
                  ),
                ),
                Positioned(
                  height: size.height - 172,
                  bottom: -size.height / 4 + 20,
                  child: SvgPicture.asset(
                    "assets/icons/abstract_figures/photo_background_blob1.svg",
                  ),
                ),
                Image.asset("assets/images/me_photo.png",
                    fit: BoxFit.fitHeight),
                Positioned(
                  height: size.height / 12,
                  right: 200,
                  top: size.height / 12,
                  child: Transform.rotate(
                    angle: -math.pi / 4,
                    child: Image.asset("assets/icons/abstract_figures/star.png",
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  height: size.height / 8,
                  left: 100,
                  top: size.height / 8,
                  child: Image.asset("assets/icons/abstract_figures/dog.png",
                      fit: BoxFit.fitHeight),
                ),
                Positioned(
                  height: size.height / 8,
                  left: 0,
                  bottom: size.height / 12,
                  child: Image.asset("assets/icons/abstract_figures/star.png",
                      fit: BoxFit.fitHeight),
                ),
              ]),
        )
      ],
    );
  }
}
