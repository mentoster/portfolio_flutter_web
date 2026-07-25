import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_diplomas.dart';

import '../../../../global_widgets/carousel_controls_widget.dart';
import '../../../../theme/responsive.dart';
import 'diploma_diploma_widget.dart';

class DiplomasCarousel extends StatelessWidget {
  DiplomasCarousel({Key? key}) : super(key: key);

  final SwiperController _controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(width);
    const height = 860.0;

    return SizedBox(
      key: Key(compact ? 'diplomas-carousel-compact' : 'diplomas-carousel-desktop'),
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: compact ? 520 : 1064),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) => DiplomaPct(
                  diploma: diplomas[index],
                ),
                itemCount: diplomas.length,
                viewportFraction: compact ? 1.0 : 0.4,
                scale: compact ? 1.0 : 0.6,
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                autoplayDelay: 6000,
                controller: _controller,
              ),
            ),
          ),
          PaperCarouselControlsWidget(
            swiperController: _controller,
            length: diplomas.length,
            axis: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}
