import 'package:flutter/material.dart';

import '../../../theme/app_constants.dart';
import '../../../theme/app_fonts.dart';
import 'widgets/diploma_text_widget.dart';
import 'widgets/diplomas_carousel.dart';

class Diplomas extends StatelessWidget {
  const Diplomas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width,
        height: 900,
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
                      DiplomasCarousel(),
                      const SizedBox(
                        width: 124,
                      ),
                      const DiplomaTextWidget()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
