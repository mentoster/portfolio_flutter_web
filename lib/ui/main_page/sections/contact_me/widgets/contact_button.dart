import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import '../../../../theme/app_constants.dart';

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
          color: Color(0x4cb1dbff),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SelectableText(
              "Связаться",
              style: heading2,
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Icon(Icons.ac_unit)
          ],
        ),
      ),
    );
  }
}
