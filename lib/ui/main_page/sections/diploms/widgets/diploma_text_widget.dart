import 'package:flutter/material.dart';

import '../../../../theme/app_constants.dart';
import '../../../../theme/app_fonts.dart';

class DiplomaTextWidget extends StatelessWidget {
  const DiplomaTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470,
      width: 434,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Cisco",
              style: TextStyle(
                  fontWeight: heading1.fontWeight,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: heading1.fontSize!),
              children: <TextSpan>[
                TextSpan(
                  text: '\nСертификат',
                  style: TextStyle(
                      fontSize: heading1.fontSize!,
                      fontWeight: heading1.fontWeight,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          const Text(
            "Сертификация компании Cisco считается одной из самых престижных сертификаций в области ИТ. \n\nЭто связано с тем, что в отличии от систем сертификации многих других вендеров, сертификационные экзамены Cisco включат в себя помимо стандартных тестов на вопросы, симуляции и настройку виртуального оборудования.",
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
                onPressed: () {},
                child: const Text(
                  'Подробнее',
                  style: appBar,
                )),
          )
        ],
      ),
    );
  }
}
