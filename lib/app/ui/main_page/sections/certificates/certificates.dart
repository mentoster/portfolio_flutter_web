import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/responsive_content.dart';
import '../../../theme/app_constants.dart';
import '../../../theme/app_fonts.dart';
import '../../../theme/responsive.dart';
import 'widgets/certificate_text_widget.dart';
import 'widgets/certificates_carousel.dart';

class CertificatesWidget extends StatefulWidget {
  CertificatesWidget({Key? key}) : super(key: key);

  final SwiperController controller = SwiperController();

  @override
  State<CertificatesWidget> createState() => _CertificatesWidgetState();
}

class _CertificatesWidgetState extends State<CertificatesWidget> {
  int index = 0;

  void indexChanged(int newIndex) {
    setState(() => index = newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(width);
    final carousel = CertificatesCarousel(
      onChanged: indexChanged,
      controller: widget.controller,
    );
    final text = CertificatesTextWidget(index: index);

    return ColoredBox(
      key: const Key('certificates-section'),
      color: Colors.lightBlue.withOpacity(0.03),
      child: ResponsiveContent(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: compactSectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Сертификаты', style: responsiveHeading1(width)),
              const SizedBox(height: defaultPadding),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 670),
                child: SelectableText(
                  'Во время обучения я получил достаточно много сертификатов, здесь вы можете посмотреть, какие конкретно.\nМои знания не ограничиваются этими сертификатами, так как много информации я получаю самостоятельно через интернет.',
                  style: responsiveBody(width),
                ),
              ),
              const SizedBox(height: 24),
              if (compact)
                Column(
                  key: const Key('certificates-compact-stack'),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    carousel,
                    const SizedBox(height: 24),
                    text,
                  ],
                )
              else
                Row(
                  key: const Key('certificates-desktop-row'),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    carousel,
                    const SizedBox(width: 124),
                    Expanded(child: text),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
