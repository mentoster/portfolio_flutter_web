import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../theme/app_constants.dart';

class HackCarouselControlsWidget extends StatelessWidget {
  final SwiperController swiperController;
  final int length;
  final Axis axis;

  const HackCarouselControlsWidget(
      {Key? key,
      required this.swiperController,
      required this.length,
      required this.axis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.black;
    const disableColor = Colors.black;
    Color prevColor;
    Color nextColor;

    final next = swiperController.index < length - 1;
    final prev = swiperController.index > 0;
    prevColor = prev ? color : disableColor;
    nextColor = next ? color : disableColor;

    Widget child;
    if (axis == Axis.horizontal) {
      child = Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            color: prevColor,
            iconDaga: Icons.arrow_back_ios,
            quarterTurns: 0,
            previous: true,
          ),
          buildButton(
            color: nextColor,
            iconDaga: Icons.arrow_forward_ios,
            quarterTurns: 0,
            previous: false,
          )
        ],
      );
    } else {
      child = Column(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            color: prevColor,
            iconDaga: Icons.arrow_back_ios,
            quarterTurns: -3,
            previous: true,
          ),
          buildButton(
            color: nextColor,
            iconDaga: Icons.arrow_forward_ios,
            quarterTurns: -3,
            previous: false,
          )
        ],
      );
    }

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: child,
    );
  }

  Widget buildButton({
    required Color color,
    required IconData iconDaga,
    required int quarterTurns,
    required bool previous,
  }) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (previous) {
            swiperController.previous(animation: true);
          } else {
            swiperController.next(animation: true);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: RotatedBox(
              quarterTurns: quarterTurns,
              child: Icon(
                iconDaga,
                semanticLabel: previous ? 'Previous' : 'Next',
                size: 48,
                color: color,
              )),
        ));
  }
}
