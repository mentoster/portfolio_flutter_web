import 'package:flutter/material.dart';

import 'widgets/left_text_column.dart';
import 'widgets/right_image_column.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 1116,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: RightImageColumn(size: size),
                ),
                const Align(
                    alignment: Alignment.centerLeft, child: LeftTextColumn()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
