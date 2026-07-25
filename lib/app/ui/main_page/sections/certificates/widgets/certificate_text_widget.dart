import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_certificates.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';

class CertificatesTextWidget extends StatelessWidget {
  const CertificatesTextWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 434),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            certificates[index].title,
            style: responsiveHeading1(width).copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: defaultPadding),
          SelectableText(
            certificates[index].description,
            style: responsiveBody(width),
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            height: 48,
            width: 178,
            child: ElevatedButton(
              onPressed: () => launchUrl(Uri.parse(certificates[index].link)),
              child: Text(
                'Подробнее',
                style: TextStyle(
                  fontSize: appBar.fontSize,
                  fontWeight: appBar.fontWeight,
                  color: Colors.white.withOpacity(0.87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
