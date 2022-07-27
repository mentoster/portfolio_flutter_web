import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 279,
        height: 83,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0x4cb1dbff),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SelectableText(
              "Связаться",
              style: heading2,
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            SizedBox(
              width: 48,
              height: 48,
              child: SvgPicture.asset("assets/icons/own_icons/connect.svg",
                  semanticsLabel: "connect"),
            ),
          ],
        ),
      ),
    );
  }
}
