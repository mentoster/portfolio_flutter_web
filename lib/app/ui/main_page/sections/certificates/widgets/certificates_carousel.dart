import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_certificates.dart';

import '../../../../global_widgets/carousel_controls_widget.dart';
import 'certificate_widget.dart';

class CertificatesCarousel extends StatelessWidget {
  CertificatesCarousel({Key? key, required this.onChanged}) : super(key: key);
  final SwiperController _controller = SwiperController();
  final Function onChanged;
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
                      return CertificatePct(
                        certificate: certificates[index],
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: certificates.length,
                    viewportFraction: 0.6,
                    scale: 0.6,
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    autoplayDelay: 6000,
                    onIndexChanged: (value) => onChanged(value),
                    controller: _controller,
                  ),
                ),
              ),
            ),
          ),
          PaperCarouselControlsWidget(
            swiperController: _controller,
            length: certificates.length,
            axis: Axis.vertical,
          ),
        ],
      ),
    );
  }
}
