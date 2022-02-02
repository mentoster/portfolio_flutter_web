import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/style/fonts.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  final _appBarPadding = 24.0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white.withOpacity(0.5),
        elevation: 0,
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color: Colors.white.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 128),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                      child: Text(
                    "Портфолио",
                    style: usualText,
                  )),
                  Row(
                    children: [
                      Text(
                        "Главная",
                        style: appBar,
                      ),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      Text(
                        "Обо мне ",
                        style: appBar,
                      ),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      Text(
                        "Опыт работы",
                        style: appBar,
                      ),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      Text(
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
                            child: Text(
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
