import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/widgets/left_text_column.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/widgets/right_image_column.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1250,
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
    );
  }
}
