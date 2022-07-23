import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/theme/app_addition_colors.dart';
import 'package:portfolio_flutter_web/ui/theme/app_fonts.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  final _appBarPadding = 24.0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white.withOpacity(0.2),
        elevation: 0,
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              border: const Border(
                bottom: BorderSide(width: 0.5, color: appBarStroke),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                      child: SelectableText(
                    "Портфолио",
                    style: usualText,
                  )),
                  Row(
                    children: [
                      const SelectableText(
                        "Главная",
                        style: appBar,
                      ),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      const SelectableText(
                        "Обо мне ",
                        style: appBar,
                      ),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      const SelectableText(
                        "Опыт работы",
                        style: appBar,
                      ),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      const SelectableText(
                        "Достижения",
                        style: appBar,
                      ),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      SizedBox(
                        height: 40,
                        width: 178,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                            onPressed: () {},
                            child: const SelectableText(
                              'Связаться',
                              style: appBar,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}
