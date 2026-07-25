import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';

class WorkExpTitleWidget extends StatelessWidget {
  const WorkExpTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SelectableText(
      'Опыт работы',
      style: responsiveHeading1(width),
      textAlign: TextAlign.center,
    );
  }
}
