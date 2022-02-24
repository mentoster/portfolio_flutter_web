import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/diploms/widgets/diploma_widget.dart';
import 'package:portfolio_flutter_web/ui/global_widgets/carousel_controls_widget.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/hackatons.dart/widgets/hackathon_diploma_widget.dart';

class DiplomasCarousel extends StatelessWidget {
  DiplomasCarousel({Key? key}) : super(key: key);
  final SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 558,
      height: 700,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 600,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
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
                      return const DiplomaWidget();
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: 6,
                    viewportFraction: 0.6,
                    scale: 0.6,
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    autoplayDelay: 6000,
                    // pagination: const SwiperPagination(),
                    controller: _controller,
                  ),
                ),
              ),
            ),
          ),
          HackCarouselControlsWidget(
            swiperController: _controller,
            length: 6,
            axis: Axis.vertical,
          ),
        ],
      ),
    );
  }
}
