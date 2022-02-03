import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/data/icons/big_icons.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

import 'widgets/InstrumentSearchWidget.dart';
import 'widgets/small_icons_wrap_widget.dart';
import 'widgets/top_five_widget.dart';

class WorkInstruments extends StatelessWidget {
  const WorkInstruments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 924,
        width: 1116,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Работал с стеком & клиент",
                style: heading1,
              ),
              SizedBox(
                height: 32,
              ),
              InstrumentSearchWidget(),
              SizedBox(
                height: 32,
              ),
              Text("Мой топ 5", style: heading2),
              SizedBox(
                height: 32,
              ),
              TopFiveWidget(),
              SizedBox(
                height: 32,
              ),
              Text("Другие", style: heading2),
              SizedBox(
                height: 32,
              ),
              SmallIconsWrapWidget(),
            ],
          ),
        ));
  }
}
