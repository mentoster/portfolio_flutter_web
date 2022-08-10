import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PaperCarouselControlsWidget extends StatelessWidget {
  final SwiperController swiperController;
  final int length;
  final Axis axis;
  const PaperCarouselControlsWidget({
    Key? key,
    required this.swiperController,
    required this.length,
    required this.axis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (axis == Axis.horizontal) {
      child = Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            icon: Icons.keyboard_arrow_left_outlined,
            previous: true,
            context: context,
          ),
          buildButton(
            icon: Icons.keyboard_arrow_right_outlined,
            previous: false,
            context: context,
          )
        ],
      );
    } else {
      child = Column(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            icon: Icons.keyboard_arrow_up_outlined,
            previous: true,
            context: context,
          ),
          buildButton(
            icon: Icons.keyboard_arrow_down_outlined,
            previous: false,
            context: context,
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
    required IconData icon,
    required bool previous,
    required BuildContext context,
  }) {
    return IconButton(
        onPressed: () {
          if (previous) {
            swiperController.previous(animation: true);
          } else {
            swiperController.next(animation: true);
          }
        },
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        iconSize: 48,
        icon: Icon(
          icon,
          semanticLabel: previous ? 'Previous' : 'Next',
          color: Theme.of(context).colorScheme.primary,
        ));
  }
}
