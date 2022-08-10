import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_constants.dart';
import '../../../theme/app_fonts.dart';
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
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: 924,
        child: Scaffold(
          backgroundColor: Colors.lightBlue.withOpacity(0.03),
          body: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SelectableText(
                    "Сертификаты",
                    style: heading1,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  const SizedBox(
                    width: 670,
                    child: SelectableText(
                      "Во время обучения я получил достаточно много сертификатов, здесь вы можете посмотреть, какие конкретно.\nМои знания не ограничиваются этими сертификатами, так как много информации я получаю самостоятельно через интернет.",
                      style: usualText,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CertificatesCarousel(
                        onChanged: indexChanged,
                        controller: widget.controller,
                      ),
                      const SizedBox(
                        width: 124,
                      ),
                      CertificatesTextWidget(
                        index: index,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
