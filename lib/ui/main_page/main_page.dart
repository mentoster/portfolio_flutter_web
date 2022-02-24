import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/ui/global_widgets/appbar.dart';
import 'package:portfolio_flutter_web/ui/theme/app_constants.dart';

import 'sections/about_me/me_and_projects.dart';
import 'sections/diploms/diplomas.dart';
import 'sections/hackatons.dart/hackathons.dart';
import 'sections/top_section/top_section.dart';
import 'sections/work_experience/work_experience.dart';
import 'sections/work_instruments/work_instruments.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          TopSection(),
          // SizedBox(
          //   height: defaultPadding * 2,
          // ),
          // MeAndProjects(),
          // WorkExperience(),
          // WorkInstruments(),
          // SizedBox(
          //   height: defaultPadding * 2,
          // ),
          Hackathons(),
          Diplomas(),
        ],
      )),
    );
  }
}
