import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';

class YearsWidget extends StatelessWidget {
  YearsWidget({Key? key}) : super(key: key);

  final _yearNow = DateTime.now().year.toString();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final style = responsiveHeading2(width);
    return SizedBox(
      width: 1100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SelectableText('2019', style: style),
          SelectableText('2020', style: style),
          SelectableText('2020', style: style),
          SelectableText('2021', style: style),
          SelectableText('2021', style: style),
          SelectableText(_yearNow, style: style),
        ],
      ),
    );
  }
}
