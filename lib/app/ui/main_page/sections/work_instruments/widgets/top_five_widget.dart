import 'package:flutter/material.dart';

import '../../../../../data/icons/big_icons.dart';
import '../../../../theme/responsive.dart';

class TopFiveWidget extends StatelessWidget {
  const TopFiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final columns = ResponsiveLayout.isDesktop(viewportWidth)
            ? 5
            : ResponsiveLayout.isTablet(viewportWidth)
                ? 3
                : availableWidth < 320
                    ? 1
                    : 2;
        final spacing = ResponsiveLayout.isMobile(viewportWidth) ? 16.0 : 24.0;
        final itemWidth =
            (availableWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          key: const Key('top-five-grid'),
          spacing: spacing,
          runSpacing: 28,
          alignment: WrapAlignment.center,
          children: [
            for (final icon in bigIconsWidgets)
              SizedBox(
                width: itemWidth,
                child: icon,
              ),
          ],
        );
      },
    );
  }
}
