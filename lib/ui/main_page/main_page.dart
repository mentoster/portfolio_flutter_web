import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/global_widgets/appbar.dart';

import 'sections/top_section/top_section.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              height: size.height,
              child: const TopSection())),
    );
  }
}
