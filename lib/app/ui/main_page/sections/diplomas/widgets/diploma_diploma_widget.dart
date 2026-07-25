import 'package:flutter/material.dart';

import '../../../../../data/models/papers.dart';
import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';

class DiplomaPct extends StatelessWidget {
  const DiplomaPct({Key? key, required this.diploma}) : super(key: key);

  final Diploma diploma;

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final available = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : viewportWidth;
        final imageWidth = available.clamp(0.0, 370.87).toDouble();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                width: imageWidth,
                child: AspectRatio(
                  aspectRatio: 370.87 / 520,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 1),
                        BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 2),
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
                        cacheWidth: 1200,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            SelectableText(
              diploma.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [for (var t in diploma.tags) tagsToWidget[t]!],
            ),
            const SizedBox(height: defaultPadding),
            SelectableText(
              diploma.shortDescription,
              style: responsiveBody(viewportWidth),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
