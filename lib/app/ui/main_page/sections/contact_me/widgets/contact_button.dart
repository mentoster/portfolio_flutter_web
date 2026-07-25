import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 279),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 64),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0x4cb1dbff),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SelectableText(
                  'Связаться',
                  style: ResponsiveLayout.isMobile(width)
                      ? const TextStyle(fontSize: 22)
                      : responsiveHeading2(width),
                ),
              ),
              const SizedBox(width: defaultPadding),
              SizedBox(
                width: 40,
                height: 40,
                child: SvgPicture.asset(
                  'assets/icons/own_icons/connect.svg',
                  semanticsLabel: 'connect',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
