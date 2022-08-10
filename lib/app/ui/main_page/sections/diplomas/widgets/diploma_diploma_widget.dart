import 'package:flutter/material.dart';

import '../../../../../data/models/papers.dart';
import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';

class DiplomaPct extends StatelessWidget {
  const DiplomaPct({Key? key, required this.diploma}) : super(key: key);
  final Diploma diploma;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 370.87,
          height: 520,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              diploma.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        SelectableText(
          diploma.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Wrap(
          spacing: 16,
          children: [
            for (var t in diploma.tags) tagsToWidget[t]!,
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        SelectableText(
          diploma.shortDescription,
          style: usualText,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
