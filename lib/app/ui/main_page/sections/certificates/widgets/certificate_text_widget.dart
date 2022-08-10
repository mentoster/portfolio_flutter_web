import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_certificates.dart';

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
    return SizedBox(
      height: 470,
      width: 434,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            certificates[index].title,
            style: TextStyle(
                fontWeight: heading1.fontWeight,
                color: Theme.of(context).colorScheme.primary,
                fontSize: heading1.fontSize!),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          SelectableText(
            certificates[index].description,
            style: usualText,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            height: 40,
            width: 178,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                ),
                onPressed: () {},
                child: Text(
                  'Подробнее',
                  style: TextStyle(
                      fontSize: appBar.fontSize,
                      fontWeight: appBar.fontWeight,
                      color: Colors.white.withOpacity(0.87)),
                )),
          )
        ],
      ),
    );
  }
}
