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
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 64,
          ),
          Container(
            color: Colors.red,
            width: size.width / 2,
            height: size.height - 64,
            child: Stack(fit: StackFit.expand, children: [
              SizedBox(
                height: size.height / 2,
                child: SvgPicture.asset(
                    "assets/icons/abstract_figures/photo_background_blob2.svg",
                    fit: BoxFit.fitHeight),
              ),
              SvgPicture.asset(
                "assets/icons/abstract_figures/photo_background_blob1.svg",
                fit: BoxFit.fitHeight,
              ),
              Image.asset("assets/images/me_photo.png", fit: BoxFit.fitHeight),
            ]),
          )
        ],
      ),
    );
  }
}
