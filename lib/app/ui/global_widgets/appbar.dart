import 'dart:ui';

import 'package:flutter/material.dart';
import '../../routes/app_pages.dart';
import 'package:url_launcher/link.dart';

import '../theme/app_addition_colors.dart';
import '../theme/app_fonts.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget(
      {Key? key,
      this.needBack = true,
      required this.controller,
      this.isDarkTheme = false})
      : super(key: key);
  final ScrollController controller;
  final bool isDarkTheme;
  final bool needBack;
  final _appBarPadding = 24.0;
  void _animateToHeight(double size, {duration = 2}) {
    controller.animateTo(
      size,
      duration: Duration(seconds: duration),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textStyle = isDarkTheme ? darkAppBar : appBar;
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: isDarkTheme
            ? Colors.black.withOpacity(0.35)
            : Colors.white.withOpacity(0.2),
        elevation: 0,
        flexibleSpace: ClipRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkTheme
                  ? Colors.black.withOpacity(0.35)
                  : Colors.white.withOpacity(0.2),
              border: Border(
                bottom: BorderSide(
                    width: 0.5,
                    color: isDarkTheme
                        ? const Color.fromARGB(90, 0, 0, 0)
                        : appBarStroke),
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
                                      child: Text(
                                        "Mentoster",
                                        style: textStyle,
                                      )))
                          : Link(
                              uri: Uri.parse(Routes.INITIAL),
                              builder: (BuildContext context,
                                      FollowLink? followLink) =>
                                  TextButton(
                                      onPressed: followLink,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_rounded,
                                            color: isDarkTheme
                                                ? Colors.white.withOpacity(0.87)
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                          ),
                                          Text(" К портфолио",
                                              style: textStyle),
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
                                      child: Text(
                                        "Главная",
                                        style: textStyle,
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
                                      child: Text(
                                        "Все Проекты",
                                        style: textStyle,
                                      ))),
                      SizedBox(
                        width: _appBarPadding,
                      ),
                      SizedBox(
                        height: 40,
                        width: 178,
                        child: Link(
                          uri: Uri.parse(Routes.INITIAL),
                          builder:
                              (BuildContext context, FollowLink? followLink) =>
                                  Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(146, 4, 102, 215),
                                  blurRadius: 24,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                                onPressed: !needBack
                                    ? () => _animateToHeight(
                                        controller.position.viewportDimension +
                                            controller.position.maxScrollExtent,
                                        duration: 6)
                                    : followLink,
                                child: Text(
                                  'Связаться',
                                  style: textStyle,
                                )),
                          ),
                        ),
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
