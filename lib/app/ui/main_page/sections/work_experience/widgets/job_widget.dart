import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';

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
    final width = MediaQuery.sizeOf(context).width;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 140, maxWidth: 176),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(title, style: responsiveHeading2(width)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SelectableText(subTitle, style: responsiveBody(width)),
          ),
        ],
      ),
    );
  }
}
