import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/ui/main_page/main_page.dart';
import 'app/ui/projects_page/projects_page.dart';
import 'app/ui/theme/app_theme.dart';


void main() {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MainPage(),
        "/projects": (context) => ProjectsPage(),
      },
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      // home: const MainPage(),
    );
  }
}
