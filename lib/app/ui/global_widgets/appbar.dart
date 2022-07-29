import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/routes/app_pages.dart';
import 'package:url_launcher/link.dart';

import '../theme/app_addition_colors.dart';
import '../theme/app_fonts.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget(
      {Key? key, required this.needBack, required this.controller})
      : super(key: key);
  final ScrollController controller;

  final bool needBack;
  final _appBarPadding = 24.0;
  void _animateToHeight(double size) {
    controller.animateTo(
      size,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
        automaticallyImplyLeading: false,
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
                  Center(
                      child: !needBack
                          ? Link(
                              uri: Uri.parse(Routes.INITIAL),
                              builder: (BuildContext context,
                                      FollowLink? followLink) =>
                                  TextButton(
                                      onPressed: followLink,
                                      child: const Text(
                                        "Mentoster",
                                        style: usualText,
                                      )))
                          : Link(
                              uri: Uri.parse(Routes.INITIAL),
                              builder: (BuildContext context,
                                      FollowLink? followLink) =>
                                  TextButton(
                                      onPressed: followLink,
                                      child: Row(
                                        children: const [
                                          Icon(Icons.arrow_back_rounded),
                                          Text(" К портфолио",
                                              style: usualText),
                                        ],
                                      )))),
                  Row(
                    children: [
                      Link(
                          uri: Uri.parse(Routes.INITIAL),
                          builder:
                              (BuildContext context, FollowLink? followLink) =>
                                  TextButton(
                                      onPressed: needBack
                                          ? followLink
                                          : () => _animateToHeight(0),
                                      child: const Text(
                                        "Главная",
                                        style: appBar,
                                      ))),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      !needBack
                          ? Row(
                              children: [
                                TextButton(
                                  onPressed: () =>
                                      _animateToHeight(size.height - 64),
                                  child: const Text(
                                    "Обо мне ",
                                    style: appBar,
                                  ),
                                ),
                                SizedBox(
                                  width: _appBarPadding,
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      Link(
                          uri: Uri.parse(Routes.PROJECTS),
                          builder:
                              (BuildContext context, FollowLink? followLink) =>
                                  TextButton(
                                      onPressed: followLink,
                                      child: const Text(
                                        "Все Проекты",
                                        style: appBar,
                                      ))),
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
                            onPressed: () => _animateToHeight(
                                controller.position.viewportDimension +
                                    controller.position.maxScrollExtent),
                            child: const Text(
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
