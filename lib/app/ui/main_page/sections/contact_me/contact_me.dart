import 'package:flutter/material.dart';

import '../../../global_widgets/responsive_content.dart';
import '../../../theme/app_constants.dart';
import '../../../theme/app_fonts.dart';
import 'widgets/contact_form.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return ColoredBox(
      color: Colors.white.withOpacity(0.05),
      child: ResponsiveContent(
        child: Padding(
          padding: const EdgeInsets.only(top: compactSectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Обсуждение проектов', style: responsiveHeading1(width)),
              const SizedBox(height: defaultPadding),
              SelectableText(
                'Здесь вы можете описать свой проект, и я с вами обязательно свяжусь.',
                style: responsiveBody(width),
              ),
              const SizedBox(height: 32),
              const ContactForm(),
            ],
          ),
        ),
      ),
    );
  }
}
