import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';

class HackTagWidget extends StatelessWidget {
  const HackTagWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xffeaeaea),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.ac_unit),
          SizedBox(
            width: 8,
          ),
          SelectableText("Российский")
        ],
      ),
    );
  }
}
