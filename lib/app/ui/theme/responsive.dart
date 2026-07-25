import 'package:flutter/widgets.dart';

enum ResponsiveViewportClass { mobile, tablet, desktop }

abstract final class ResponsiveLayout {
  static const double mobileBreakpoint = 768;
  static const double desktopBreakpoint = 1200;
  static const double maxContentWidth = 1200;

  static ResponsiveViewportClass viewportClass(double width) {
    if (width < mobileBreakpoint) {
      return ResponsiveViewportClass.mobile;
    }
    if (width < desktopBreakpoint) {
      return ResponsiveViewportClass.tablet;
    }
    return ResponsiveViewportClass.desktop;
  }

  static bool isMobile(double width) =>
      viewportClass(width) == ResponsiveViewportClass.mobile;

  static bool isTablet(double width) =>
      viewportClass(width) == ResponsiveViewportClass.tablet;

  static bool isDesktop(double width) =>
      viewportClass(width) == ResponsiveViewportClass.desktop;

  static bool isCompact(double width) => width < desktopBreakpoint;

  static double pagePadding(double width) {
    switch (viewportClass(width)) {
      case ResponsiveViewportClass.mobile:
        return 16;
      case ResponsiveViewportClass.tablet:
        return 32;
      case ResponsiveViewportClass.desktop:
        return 0;
    }
  }

  static double heading1Size(double width) {
    switch (viewportClass(width)) {
      case ResponsiveViewportClass.mobile:
        return 36;
      case ResponsiveViewportClass.tablet:
        return 48;
      case ResponsiveViewportClass.desktop:
        return 60;
    }
  }

  static double heading2Size(double width) {
    switch (viewportClass(width)) {
      case ResponsiveViewportClass.mobile:
        return 26;
      case ResponsiveViewportClass.tablet:
        return 32;
      case ResponsiveViewportClass.desktop:
        return 36;
    }
  }

  static double bodySize(double width) {
    switch (viewportClass(width)) {
      case ResponsiveViewportClass.mobile:
        return 16;
      case ResponsiveViewportClass.tablet:
        return 18;
      case ResponsiveViewportClass.desktop:
        return 20;
    }
  }

  static double heroTitleSize(double width) {
    switch (viewportClass(width)) {
      case ResponsiveViewportClass.mobile:
        return 48;
      case ResponsiveViewportClass.tablet:
        return 64;
      case ResponsiveViewportClass.desktop:
        return 90;
    }
  }

  static double heroSubtitleSize(double width) {
    switch (viewportClass(width)) {
      case ResponsiveViewportClass.mobile:
        return 24;
      case ResponsiveViewportClass.tablet:
        return 30;
      case ResponsiveViewportClass.desktop:
        return 36;
    }
  }

  static double heroBodySize(double width) {
    switch (viewportClass(width)) {
      case ResponsiveViewportClass.mobile:
        return 18;
      case ResponsiveViewportClass.tablet:
        return 20;
      case ResponsiveViewportClass.desktop:
        return 30;
    }
  }

  static double widthOf(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
}
