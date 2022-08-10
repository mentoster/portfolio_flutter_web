import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';

class WorkExpTitleWidget extends StatelessWidget {
  const WorkExpTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SelectableText(
      "Опыт работы",
      style: heading1,
      textAlign: TextAlign.center,
    );
  }
}
