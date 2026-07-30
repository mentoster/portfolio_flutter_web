import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';

class YearsWidget extends StatelessWidget {
  YearsWidget({Key? key}) : super(key: key);

  final _yearNow = DateTime.now().year.toString();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final style = responsiveHeading2(width);
    final years = ['2019', '2020', '2020', '2021', '2021', _yearNow];

    return Row(
      key: const Key('work-years-row'),
      children: [
        for (final year in years)
          Expanded(
            child: SelectableText(
              year,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
