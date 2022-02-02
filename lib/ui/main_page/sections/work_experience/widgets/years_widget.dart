import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class YearsWidget extends StatelessWidget {
  const YearsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text(
          "2019",
          style: heading2,
        ),
        Text(
          "2019",
          style: heading2,
        ),
        Text(
          "2019",
          style: heading2,
        ),
        Text(
          "2019",
          style: heading2,
        ),
        Text(
          "2019",
          style: heading2,
        ),
        Text(
          "2019",
          style: heading2,
        ),
      ],
    );
  }
}
