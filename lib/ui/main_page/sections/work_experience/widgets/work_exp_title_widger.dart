import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class WorkExpTitleWidget extends StatelessWidget {
  const WorkExpTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Опыт работы",
      style: heading1,
      textAlign: TextAlign.center,
    );
  }
}
