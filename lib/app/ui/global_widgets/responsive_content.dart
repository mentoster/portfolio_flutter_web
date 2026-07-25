import 'package:flutter/material.dart';

import '../theme/responsive.dart';

class ResponsiveContent extends StatelessWidget {
  const ResponsiveContent({
    Key? key,
    required this.child,
    this.maxWidth = ResponsiveLayout.maxContentWidth,
    this.alignment = Alignment.topCenter,
  }) : super(key: key);

  final Widget child;
  final double maxWidth;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final horizontalPadding = ResponsiveLayout.pagePadding(width);

        return Align(
          alignment: alignment,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SizedBox(width: double.infinity, child: child),
            ),
          ),
        );
      },
    );
  }
}
