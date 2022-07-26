import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import '../../../theme/app_constants.dart';
import 'widgets/big_input_widget.dart';
import 'widgets/contact_button.dart';
import 'widgets/contact_form.dart';
import 'widgets/input_widget.dart';
import 'widgets/social_network_button.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 875,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.05),
        body: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: defaultPadding * 2,
                ),
                SelectableText(
                  "Обсуждение проектов",
                  style: heading1,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                SelectableText(
                  "Здесь вы можете описать свой проект, и я с вами обязательно свяжусь.",
                  style: usualText,
                ),
                SizedBox(
                  height: 32,
                ),
                ContactForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
