import 'package:flutter/material.dart';

import '../../../global_widgets/animated_background.dart';
import '../../../global_widgets/responsive_content.dart';
import '../../../theme/responsive.dart';
import 'widgets/left_text_column.dart';
import 'widgets/right_image_column.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key, required this.controller}) : super(key: key);

  final ScrollController controller;

  Widget _buildDesktop(BuildContext context, Size size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBackground(size: size),
        SizedBox(
          height: size.height,
          child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: RightImageColumn(size: size),
                ),
                Align(
                  alignment: Alignment.center,
                  child: LeftTextColumn(controller: controller),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompact(BuildContext context, Size size) {
    return Stack(
      children: [
        const Positioned.fill(child: AnimatedBackground()),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Padding(
            padding: const EdgeInsets.only(top: 110, bottom: 48),
            child: ResponsiveContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LeftTextColumn(controller: controller),
                  const SizedBox(height: 24),
                  RightImageColumn(size: size),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (ResponsiveLayout.isCompact(size.width)) {
      return _buildCompact(context, size);
    }
    return _buildDesktop(context, size);
  }
}
