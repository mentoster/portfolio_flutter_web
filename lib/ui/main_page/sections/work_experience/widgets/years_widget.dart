import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class YearsWidget extends StatelessWidget {
  YearsWidget({
    Key? key,
  }) : super(key: key);
  final _yearNow = DateTime.now().year.toString();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SelectableText(
          "2019",
          style: heading2,
        ),
        const SelectableText(
          "2020",
          style: heading2,
        ),
        const SelectableText(
          "2020",
          style: heading2,
        ),
        const SelectableText(
          "2021",
          style: heading2,
        ),
        const SelectableText(
          "2021",
          style: heading2,
        ),
        SelectableText(
          _yearNow,
          style: heading2,
        ),
      ],
    );
  }
}
