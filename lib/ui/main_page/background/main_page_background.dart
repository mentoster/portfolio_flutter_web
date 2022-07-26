import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPageBackGround extends StatelessWidget {
  const MainPageBackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: 5700,
        width: 1600,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -340,
              left: -100,
              child:
                  SvgPicture.asset("assets/icons/abstract_figures/blob1.svg"),
              width: 800,
              height: 800,
            ),
            Positioned(
              top: 30,
              right: -150,
              child:
                  SvgPicture.asset("assets/icons/abstract_figures/blob2.svg"),
              width: 700,
              height: 700,
            ),
            Positioned(
              top: size.width / 3 - 25,
              left: 125,
              child:
                  SvgPicture.asset("assets/icons/abstract_figures/blob3.svg"),
              width: 100,
              height: 100,
            ),
            Positioned(
              top: size.width / 6,
              right: 20,
              child: Opacity(
                  opacity: 0.2,
                  child: SvgPicture.asset(
                      "assets/icons/abstract_figures/blob3.svg")),
              width: 800,
              height: 800,
            ),
          ],
        ),
      ),
    );
  }
}
