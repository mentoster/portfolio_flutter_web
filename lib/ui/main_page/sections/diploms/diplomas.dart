import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import 'widgets/diploma_text_widget.dart';
import 'widgets/diplomas_carousel.dart';

class Diplomas extends StatelessWidget {
  const Diplomas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1116,
        height: 1000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Сертификаты",
              style: heading1,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            const SizedBox(
              width: 670,
              child: Text(
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
                DiplomasCarousel(),
                const SizedBox(
                  width: 124,
                ),
                const DiplomaTextWidget()
                // DiplomasCarousel(),
              ],
            ),
          ],
        ));
  }
}