import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';


import '../../../../global_widgets/carousel_controls_widget.dart';
import 'hackathon_diploma_widget.dart';

class HackathonCarousel extends StatelessWidget {
  HackathonCarousel({Key? key}) : super(key: key);
  final SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1116,
      height: 700,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 1000,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: SizedBox(
                  height: 700,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return const HackathonDiplomaWidget();
                    },
                    itemCount: 6,
                    viewportFraction: 0.4,
                    scale: 0.6,
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    autoplayDelay: 6000,
                    controller: _controller,
                  ),
                ),
              ),
            ),
          ),
          HackCarouselControlsWidget(
            swiperController: _controller,
            length: 6,
            axis: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}
