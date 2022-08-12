import 'package:flutter/material.dart';

import '../../../global_widgets/animated_background.dart';
import 'widgets/left_text_column.dart';
import 'widgets/right_image_column.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key, required this.controller}) : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(alignment: Alignment.center, children: [
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
                  child: LeftTextColumn(
                    controller: controller,
                  )),
            ],
          ),
        ),
      ),
    ]);
  }
}
