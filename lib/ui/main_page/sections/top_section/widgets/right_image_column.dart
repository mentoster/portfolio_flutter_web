import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              ]),
        )
      ],
    );
  }
}
