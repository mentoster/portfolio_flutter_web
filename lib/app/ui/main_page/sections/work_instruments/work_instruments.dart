import 'package:flutter/material.dart';

import '../../../global_widgets/search_widget.dart';
import '../../../theme/app_fonts.dart';
import 'widgets/small_icons_wrap_widget.dart';
import 'widgets/top_five_widget.dart';

class WorkInstruments extends StatelessWidget {
  const WorkInstruments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
        height: 988,
        width: size.width,
        child: Scaffold(
          backgroundColor: Colors.green.withOpacity(0.03),
          body: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 32,
                  ),
                  SelectableText(
                    "Работал с стеком & клиент",
                    style: heading1,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SearchWidget(),
                  SizedBox(
                    height: 32,
                  ),
                  SelectableText("Мой топ 5", style: heading2),
                  SizedBox(
                    height: 32,
                  ),
                  TopFiveWidget(),
                  SizedBox(
                    height: 32,
                  ),
                  SelectableText("Другие", style: heading2),
                  SizedBox(
                    height: 32,
                  ),
                  SmallIconsWrapWidget(),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
