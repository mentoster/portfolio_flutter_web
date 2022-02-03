import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/data/icons/big_icons.dart';

class TopFiveWidget extends StatelessWidget {
  const TopFiveWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      children: bigIconsWidgets,
    );
  }
}
