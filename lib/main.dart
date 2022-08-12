import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app/routes/app_pages.dart';
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
      initialRoute: Routes.INITIAL,
      routes: AppPages.routes,
      title: 'Portfolio',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
    );
  }
}
