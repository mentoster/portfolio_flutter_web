import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

  Widget _paragraph(String text, double width) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: SelectableText(
        text,
        style: responsiveBody(width).copyWith(color: Colors.grey[600], height: 1.45),
      ),
    );
  }

  Widget _experience(BuildContext context, double width) {
    final compact = ResponsiveLayout.isCompact(width);
    final numberSize = ResponsiveLayout.isMobile(width) ? 64.0 : compact ? 76.0 : 96.0;
    return RichText(
      text: TextSpan(
        text: '${DateTime.now().year - 2019}+',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: numberSize,
          fontWeight: heading1.fontWeight,
        ),
        children: [
          TextSpan(
            text: '\nГода опыта',
            style: responsiveHeading2(width).copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final mobile = ResponsiveLayout.isMobile(width);

    final children = <Widget>[
      SelectableText(
        mobile ? 'Обо мне' : 'Обо\nмне',
        style: responsiveHeading1(width),
      ),
      _paragraph(
        'Я заинтересовался технологиями с самого детства. С ответственностью и интересом подхожу к каждому проекту. Быстро осваиваю новые направления и навыки. Часто работаю в интенсивном режиме и выходные дни (при необходимости).',
        width,
      ),
      _experience(context, width),
      _paragraph(
        'Мой опыт в именно профессиональной деятельности начинается в момент поступления в вуз. Меня заинтересовало направления программная инженерия и с тех пор я каждый день читаю техническую литературу о технологиях, которые мне интересны.',
        width,
      ),
    ];

    if (mobile) {
      return Column(
        key: const Key('about-mobile-column'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1) const SizedBox(height: 24),
          ],
        ],
      );
    }

    return Wrap(
      key: const Key('about-responsive-wrap'),
      spacing: 64,
      runSpacing: 32,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: children,
    );
  }
}
