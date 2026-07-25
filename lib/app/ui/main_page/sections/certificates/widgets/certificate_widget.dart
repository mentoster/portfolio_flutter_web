import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/models/papers.dart';

class CertificatePct extends StatelessWidget {
  const CertificatePct({Key? key, required this.certificate}) : super(key: key);

  final Certificate certificate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth.clamp(0.0, 500.0).toDouble()
            : 500.0;
        return Center(
          child: SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
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
                    certificate.image,
                    fit: BoxFit.fill,
                    cacheWidth: 1500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
