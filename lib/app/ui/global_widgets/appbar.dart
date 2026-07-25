import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../routes/app_pages.dart';
import '../theme/app_addition_colors.dart';
import '../theme/app_fonts.dart';
import '../theme/responsive.dart';

enum _AppBarAction { home, about, projects, contact }

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    this.needBack = true,
    required this.controller,
    this.isDarkTheme = false,
    this.homeHeroKey,
  }) : super(key: key);

  final ScrollController controller;
  final bool isDarkTheme;
  final bool needBack;
  final GlobalKey? homeHeroKey;
  final _appBarPadding = 24.0;

  void _animateToHeight(double size, {int duration = 2}) {
    if (!controller.hasClients) {
      return;
    }
    final target = size.clamp(0.0, controller.position.maxScrollExtent);
    controller.animateTo(
      target,
      duration: Duration(seconds: duration),
      curve: Curves.fastOutSlowIn,
    );
  }

  double _measuredHeroEnd() {
    final renderObject = homeHeroKey?.currentContext?.findRenderObject();
    if (renderObject is RenderBox && renderObject.hasSize) {
      return renderObject.size.height;
    }
    return 0;
  }

  void _handleCompactAction(BuildContext context, _AppBarAction action) {
    if (!needBack) {
      switch (action) {
        case _AppBarAction.home:
          _animateToHeight(0);
          return;
        case _AppBarAction.about:
          _animateToHeight(_measuredHeroEnd());
          return;
        case _AppBarAction.projects:
          Navigator.of(context).pushNamed(Routes.PROJECTS);
          return;
        case _AppBarAction.contact:
          if (controller.hasClients) {
            _animateToHeight(controller.position.maxScrollExtent, duration: 6);
          }
          return;
      }
    }

    switch (action) {
      case _AppBarAction.projects:
        Navigator.of(context).pushNamed(Routes.PROJECTS);
        return;
      case _AppBarAction.home:
      case _AppBarAction.contact:
        Navigator.of(context).pushNamed(Routes.INITIAL);
        return;
      case _AppBarAction.about:
        return;
    }
  }

  Widget _brand(BuildContext context, TextStyle textStyle) {
    return Center(
      child: Link(
        uri: Uri.parse(Routes.INITIAL),
        builder: (BuildContext context, FollowLink? followLink) => TextButton(
          onPressed: followLink,
          child: !needBack
              ? Text('Mentoster', style: textStyle)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: isDarkTheme
                          ? Colors.white.withOpacity(0.87)
                          : Theme.of(context).colorScheme.primary,
                    ),
                    Text(' К портфолио', style: textStyle),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _compactMenu(BuildContext context, TextStyle textStyle) {
    final actions = needBack
        ? const [
            _AppBarAction.home,
            _AppBarAction.projects,
            _AppBarAction.contact,
          ]
        : const [
            _AppBarAction.home,
            _AppBarAction.about,
            _AppBarAction.projects,
            _AppBarAction.contact,
          ];

    String labelFor(_AppBarAction action) {
      switch (action) {
        case _AppBarAction.home:
          return 'Главная';
        case _AppBarAction.about:
          return 'Обо мне';
        case _AppBarAction.projects:
          return 'Все Проекты';
        case _AppBarAction.contact:
          return 'Связаться';
      }
    }

    return SizedBox(
      width: 48,
      height: 48,
      child: PopupMenuButton<_AppBarAction>(
        key: const Key('compact-nav-menu'),
        tooltip: 'Меню',
        onSelected: (action) => _handleCompactAction(context, action),
        icon: Icon(
          Icons.menu_rounded,
          color: isDarkTheme ? Colors.white : Theme.of(context).colorScheme.primary,
        ),
        itemBuilder: (context) => [
          for (final action in actions)
            PopupMenuItem<_AppBarAction>(
              value: action,
              child: Text(labelFor(action), style: textStyle),
            ),
        ],
      ),
    );
  }

  Widget _desktopActions(BuildContext context, TextStyle textStyle) {
    return Row(
      children: [
        Link(
          uri: Uri.parse(Routes.INITIAL),
          builder: (BuildContext context, FollowLink? followLink) => TextButton(
            onPressed: needBack ? followLink : () => _animateToHeight(0),
            child: Text('Главная', style: textStyle),
          ),
        ),
        SizedBox(width: _appBarPadding),
        if (!needBack) ...[
          TextButton(
            onPressed: () => _animateToHeight(_measuredHeroEnd()),
            child: const Text('Обо мне ', style: appBar),
          ),
          SizedBox(width: _appBarPadding),
        ],
        Link(
          uri: Uri.parse(Routes.PROJECTS),
          builder: (BuildContext context, FollowLink? followLink) => TextButton(
            onPressed: followLink,
            child: Text('Все Проекты', style: textStyle),
          ),
        ),
        SizedBox(width: _appBarPadding),
        SizedBox(
          height: 40,
          width: 178,
          child: Link(
            uri: Uri.parse(Routes.INITIAL),
            builder: (BuildContext context, FollowLink? followLink) => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.50),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: !needBack
                    ? () {
                        if (controller.hasClients) {
                          _animateToHeight(
                            controller.position.maxScrollExtent,
                            duration: 6,
                          );
                        }
                      }
                    : followLink,
                child: const Text(
                  'Связаться',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(width);
    final textStyle = isDarkTheme ? darkAppBar : appBar;
    final horizontalPadding = compact ? ResponsiveLayout.pagePadding(width) : 64.0;

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
                      : appBarStroke,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _brand(context, textStyle),
                  Center(
                    child: compact
                        ? _compactMenu(context, textStyle)
                        : _desktopActions(context, textStyle),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}
