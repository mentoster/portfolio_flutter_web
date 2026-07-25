import 'dart:math' as math;

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_certificates.dart';

import '../../../../global_widgets/carousel_controls_widget.dart';
import '../../../../theme/responsive.dart';
import 'certificate_widget.dart';

class CertificatesCarousel extends StatelessWidget {
  const CertificatesCarousel({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final SwiperController controller;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(viewportWidth);

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : viewportWidth;
        final compactImageWidth = math.min(availableWidth, 500.0);
        final height = compact ? compactImageWidth + 88 : 700.0;

        return SizedBox(
          key: Key(compact
              ? 'certificates-carousel-compact'
              : 'certificates-carousel-desktop'),
          width: compact ? double.infinity : 558,
          height: height,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: compact ? compactImageWidth : 558,
                  height: compact ? compactImageWidth : 600,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return CertificatePct(certificate: certificates[index]);
                    },
                    scrollDirection: compact ? Axis.horizontal : Axis.vertical,
                    itemCount: certificates.length,
                    viewportFraction: compact ? 1.0 : 0.6,
                    scale: compact ? 1.0 : 0.6,
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    autoplayDelay: 6000,
                    controller: controller,
                    onIndexChanged: (value) => onChanged(value),
                  ),
                ),
              ),
              PaperCarouselControlsWidget(
                swiperController: controller,
                length: certificates.length,
                axis: compact ? Axis.horizontal : Axis.vertical,
              ),
            ],
          ),
        );
      },
    );
  }
}
