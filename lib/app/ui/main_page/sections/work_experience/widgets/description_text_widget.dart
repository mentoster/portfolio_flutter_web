import 'package:flutter/material.dart';

import '../../../../theme/app_fonts.dart';
import '../../../../theme/responsive.dart';

class DescriptionTextWidget extends StatelessWidget {
  const DescriptionTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SelectableText(
      ResponsiveLayout.isCompact(width)
          ? 'Информацию о том, когда я начал заниматься той или иной технологией вы можете найти в моем опыте работы.  Соответствующие данные расположенны на таймлайне.'
          : 'Информацию о том, когда я начал заниматься той или иной технологией\nвы можете найти в моем опыте работы.  Соответствующие\nданные расположенны на таймлайне.',
      style: responsiveBody(width),
      textAlign: TextAlign.center,
    );
  }
}
