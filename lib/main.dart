import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/main_page/sections/top_section/top_section.dart';

import 'ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      home: const TopSection(),
    );
  }
}
