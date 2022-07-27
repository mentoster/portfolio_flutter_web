import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';

class DescriptionTextWidget extends StatelessWidget {
  const DescriptionTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SelectableText(
      "Информацию о том, когда я начал заниматься той или иной технологией\nвы можете найти в моем опыте работы.  Соответствующие\nданные расположенны на таймлайне.",
      style: usualText,
      textAlign: TextAlign.center,
    );
  }
}
