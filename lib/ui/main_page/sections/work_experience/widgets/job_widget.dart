import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          title,
          style: heading2,
        ),
        Container(
            width: 164,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: SelectableText(
              subTitle,
              style: usualText,
            )),
      ],
    );
  }
}
