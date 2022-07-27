import 'package:flutter/material.dart';

import '../global_widgets/appbar.dart';
import 'background/main_page_background.dart';
import 'background/main_page_filter.dart';
import 'sections/about_me/me_and_projects.dart';
import 'sections/contact_me/contact_me.dart';
import 'sections/diploms/diplomas.dart';
import 'sections/hackatons.dart/hackathons.dart';
import 'sections/top_section/top_section.dart';
import 'sections/work_experience/work_experience.dart';
import 'sections/work_instruments/work_instruments.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarWidget(needBack: false),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(

          child: Stack(children: [
        const MainPageBackGround(),
        MainPageFilter(size: size),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TopSection(),
            MeAndProjects(),
            WorkExperience(),
            WorkInstruments(),
            Hackathons(),
            Diplomas(),
            ContactMe(),
          ],
        ),
      ])),
    );
  }
}
